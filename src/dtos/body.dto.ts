import { IsNumber, IsOptional, IsString } from "class-validator";
import { Type } from 'class-transformer';


export class AuthDto {
    @IsString()
    phone_number: string;

    @IsString()
    password: string;

}

export class ProductDetail {
    @IsOptional()
    @IsString()
    description: string;

    @IsNumber()
    buy_price: number;

    @IsNumber()
    sell_price: number;

    @IsNumber()
    stock: number;

    @IsOptional()
    @IsString()
    url_image: string;
}

export class AddProductDto {
    @IsString()
    product_name: string;

    @IsString()
    sku: string;

    @IsOptional()
    @IsString()
    category: string;

    @Type(() => ProductDetail)
    detail: ProductDetail

    public createParams() {
        return {
            name: this.product_name,
            sku: this.sku,
            category: this.category,
            detail: {
                description: this.detail.description,
                buyPrice: this.detail.buy_price ? this.detail.buy_price : 0,
                sellPrice: this.detail.sell_price ? this.detail.sell_price : 0,
                stock: this.detail.stock ? this.detail.stock : 0,
                urlImage: this.detail.url_image
            }
        };
    }
}

export class AddUserDto {
    @IsString()
    name: string;

    @IsString()
    email: string;

    @IsString()
    phone_number: string;

    @IsString()
    password: string;
}