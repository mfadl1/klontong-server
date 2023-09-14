import { inject, injectable } from "inversify";
import { Body, JsonController, Post } from "routing-controllers";
import { AuthQuery, API as AuthenticatorAPI } from "@brik/user-service";
import ResponseDto from "@/dtos/response.dto";
import { AddUserDto, AuthDto } from "@/dtos/body.dto";

@JsonController("/auth")
@injectable()
export default class ProductController {
  constructor(
    @inject(AuthenticatorAPI.AuthQuery)
    private authQuery: AuthQuery
  ) {}

  @Post("/add-user")
  async register(@Body() body: AddUserDto) {
    const userDetail = await this.authQuery.register({
      name: body.name,
      email: body.email,
      password: body.password,
      phoneNumber: body.phone_number,
    });

    return ResponseDto.success(userDetail);
  }

  @Post("/login")
  async login(@Body() body: AuthDto) {
    const loginData = await this.authQuery.login({
      phoneNumber: body.phone_number,
      password: body.password,
    });

    return ResponseDto.success({
      user_data: {
        id: loginData.userData.id,
        name: loginData.userData.name,
        phone_number: loginData.userData.phoneNumber,
        email: loginData.userData.email,
      },
      token_data: loginData.tokenData,
    });
  }
}
