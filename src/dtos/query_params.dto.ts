import {
    IsBoolean,
    IsDate,
    IsDateString,
    IsEnum,
    IsInt,
    IsNumber,
    IsOptional,
    IsString,
    isNumber,
} from 'class-validator';
import { JSONSchema } from 'class-validator-jsonschema';

export class getProductQuery {
    @IsOptional()
    @IsString()
    name: string;

    @IsNumber()
    page: number;

    @IsOptional()
    @IsNumber()
    limit: number;
}