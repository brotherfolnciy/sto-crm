import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sto_crm/dto/response/offer.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://nastintesthodl.stocrm.ru/api/external/v1/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @POST("/offers/get_from_filter")
  Future<OffersResponse> fetchOffers(
    @Body() Map<String, dynamic> request,
  );
}
