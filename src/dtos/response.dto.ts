import { IsDateString, IsNumber, IsString, isNumber } from "class-validator";
import { IHttpResponse } from "./interface";
import { JSONSchema } from "class-validator-jsonschema";
import { Product } from "@brik/inventory-service";

export default class ResponseDto {
  static success<T>(result: T, message = null): IHttpResponse<T> {
    return {
      success: true,
      message,
      result,
    };
  }

  static fail<T>(message: string): IHttpResponse<T> {
    return {
      success: false,
      message,
      result: null,
    };
  }
}

export class ProductDTO {
  @JSONSchema({
    description: "product id",
    example: 6,
  })
  @IsNumber()
  id: number;

  @JSONSchema({
    description: "product name",
    example: "womens shoes",
  })
  @IsString()
  name: string;

  @JSONSchema({
    description: "product sku",
    example: "WOM-WOMEN-STRIP-HEEL",
  })
  @IsString()
  sku: string;

  @JSONSchema({
    description: "product category",
    example: "shoes",
  })
  @IsString()
  category: string;

  @JSONSchema({
    description: "product sell price",
    example: "womens shoes",
  })
  @IsNumber()
  sell_price: number;

  @JSONSchema({
    description: "product url image",
    example: "https://i.dummyjson.com/data/products/4/thumbnail.jpg",
  })
  @IsString()
  url_image: string;

  @JSONSchema({
    description: "product description",
    example: "OPPO F19 is officially announced on April 2021.",
  })
  @IsString()
  description: string;

  @JSONSchema({
    description: "product rating",
    example: 3.9,
  })
  @IsString()
  rating: number;

  @JSONSchema({
    description: "product stock",
    example: 6,
  })
  @IsString()
  stock: number;

  @JSONSchema({
    description: "timestamp when record was created",
    example: "2022-12-16T02:06:26.662+00:00",
  })
  @IsDateString()
  created_at: Date;

  @JSONSchema({
    description: "record last updated",
    example: "2023-01-16T02:06:26.662+00:00",
  })
  @IsDateString()
  updated_at: Date;

  constructor(val?: Product) {
    this.id = val?.id;
    this.name = val?.name;
    this.sku = val?.sku;
    this.category = val?.category;
    this.description = val?.productDetail.description;
    this.sell_price = val?.productDetail.sellPrice
    this.rating = val?.productDetail.rating
    this.url_image = val?.productDetail.urlImage
    this.stock = val?.productDetail.stock
    this.created_at = val?.createdAt;
    this.updated_at =
      new Date(val?.updatedAt) >= new Date(val?.productDetail.updatedAt)
        ? val?.updatedAt
        : val?.productDetail.updatedAt;
  }
}
