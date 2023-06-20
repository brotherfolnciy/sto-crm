import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sto_crm/client/client.dart';
import 'package:sto_crm/dto/request/fetch_offers.dart';
import 'package:sto_crm/dto/response/offer.dart';

part 'offers_state.dart';
part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit({
    required this.client,
  }) : super(const OffersState.initial());

  final RestClient client;

  Future<void> fetchOffers() async {
    emit(const OffersState.loading());

    const request = FetchOffersRequest(
      page: 1,
      limit: 12,
      requiredFields: ["OFFERS_TYPE_NAME"],
    );

    try {
      final offersResponse =
          await client.fetchOffers(request.toJson()).then((r) => r.response);

      emit(OffersState.success(
        offers: offersResponse.data,
      ));
    } on DioException catch (_) {
      emit(const OffersState.failure());
    }
  }
}
