import { inject, injectable } from "inversify";
import {
  Body,
  Delete,
  Get,
  JsonController,
  Param,
  Post,
  QueryParams,
  Req,
} from "routing-controllers";
import {
  API as InventoryAPI,
  Product,
  ProductCrudService,
} from "@brik/inventory-service";
import { AuthQuery, API as AuthenticatorAPI } from "@brik/user-service";
import ResponseDto, { ProductDTO } from "@/dtos/response.dto";
import { AddProductDto } from "@/dtos/body.dto";
import { Request } from "express";
import { getProductQuery } from "@/dtos/query_params.dto";
import { offsetCalculator } from "@/utils/util";

@JsonController("/products")
@injectable()
export default class ProductController {
  constructor(
    @inject(InventoryAPI.ProductCrudService)
    private productCrudService: ProductCrudService,
    @inject(AuthenticatorAPI.AuthQuery)
    private authQuery: AuthQuery
  ) {}

  @Get()
  async getProducts(
    @Req() req: Request,
    @QueryParams() queryParam: getProductQuery
  ) {
    // await this.authQuery.authMiddleware(req);

    const limit = queryParam.limit || 5;
    const currentPage = queryParam.page;
    const ctx = this.productCrudService.createQueryContext();

    ctx
      .offset(offsetCalculator(currentPage, limit))
      .limit(limit)
      .isActive(true)
      .orderBy({ by: "name", order: "asc" });

    const result = await this.productCrudService.findAndCount(ctx);
    const totalData = result.count;
    const resultData = Array.from(result.data).map(
      (val: Product) => new ProductDTO(val)
    );

    return ResponseDto.success({
      total_data: totalData,
      current_page: currentPage,
      per_page: limit,
      total_pages: Math.ceil(totalData / limit),
      data: resultData,
    });
  }

  @Delete("/:id")
  async deleteProduct(@Req() req: Request, @Param("id") productId: number) {
    await this.authQuery.authMiddleware(req);

    await this.productCrudService.delete(productId);

    return ResponseDto.success({});
  }

  @Post("/add")
  async addProduct(@Req() req: Request, @Body() body: AddProductDto) {
    await this.authQuery.authMiddleware(req);
    
    const params = body.createParams();
    const response = await this.productCrudService.create(params);
    const result = new ProductDTO(response);

    return ResponseDto.success(result);
  }
}
