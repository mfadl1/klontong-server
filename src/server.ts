import path from "path";
import App from "./app";
import { logger } from "./utils/logger";
import { AUTHENTICATOR_SCHEMA, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USERNAME, INVENTORY_SCHEMA, JWT_EXPIRES_IN, JWT_SECRET_KEY } from "./config";
import { Container as DIContainer } from 'inversify';
import glob from 'glob';
import {
    API as InventoryAPI,
    MikroormDriver as InventoryMikroOrmDriver,
} from '@brik/inventory-service';
import {
    API as AuthenticatorAPI,
    MikroormDriver as AuthenticatorMikroOrmDriver,
} from '@brik/user-service';

const Container = new DIContainer({ defaultScope: 'Singleton' });
// load all controllers
glob(
    path.join(__dirname + '/controllers/**/*.controller.{js,ts}'),
    function (_, files) {
        Promise.all(
            files.map(file => {
                return import(file.replace(__dirname, '.'));
            }),
        ).then(async controllers => {
            controllers = controllers.map(controller => controller.default);

            const inventoryMikroOrmDriver = new InventoryMikroOrmDriver({
                host: DB_HOST,
                port: Number(DB_PORT),
                db: DB_NAME,
                user: DB_USERNAME,
                password: DB_PASSWORD,
                schema: INVENTORY_SCHEMA,
            });

            await inventoryMikroOrmDriver.init();
            Container.bind(InventoryAPI.ProductCrudService).toConstantValue(
                inventoryMikroOrmDriver.get(InventoryAPI.ProductCrudService),
            );

            const authenticatorMikroOrmDriver = new AuthenticatorMikroOrmDriver(
                {
                    host: DB_HOST,
                    port: Number(DB_PORT),
                    db: DB_NAME,
                    user: DB_USERNAME,
                    password: DB_PASSWORD,
                    schema: AUTHENTICATOR_SCHEMA,
                },
                JWT_SECRET_KEY,
                JWT_EXPIRES_IN,
            );

            await authenticatorMikroOrmDriver.init();
            Container.bind(AuthenticatorAPI.AuthQuery).toConstantValue(
                authenticatorMikroOrmDriver.get(AuthenticatorAPI.AuthQuery),
            );

            controllers.forEach(controller => {
                Container.bind(controller).toSelf();
            });
            

            Container.bind(App).toSelf();
            try {
                const app = new App(controllers, Container);
                app.listen();
            } catch (ex) {
                logger.error(`Application failed to start!, ${ex.message}`);
            }
        });
    },
);
