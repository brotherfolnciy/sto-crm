import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sto_crm/client/client.dart';
import 'package:sto_crm/dto/request/fetch_offers.dart';
import 'package:sto_crm/sid_interceptor.dart';

void main() {
  final dio = Dio();
  dio.interceptors.add(sidInterceptor);
  final client = RestClient(dio);

  test(
    'Offers must be fetched',
    () async {
      const request = FetchOffersRequest(
        limit: 10,
        page: 1,
      );

      final result = await client.fetchOffers(request.toJson());

      expect(result.response.data.isNotEmpty, true);
    },
  );
}
