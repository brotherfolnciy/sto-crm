import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sto_crm/client/client.dart';
import 'package:sto_crm/dto/request/fetch_offers.dart';
import 'package:sto_crm/dto/response/offer.dart';
import 'package:sto_crm/dto/response/offer_status.dart';

part 'offers_state.dart';
part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit({
    required this.client,
  }) : super(const OffersState.initial());

  final RestClient client;

  Future<void> fetchData() async {
    emit(const OffersState.loading());

    const request = FetchOffersRequest(
      page: 1,
      limit: 10,
    );

    const boardId = 1843;

    try {
      final offersResponse =
          await client.fetchOffers(request).then((r) => r.response);
      final statusesResponse =
          await client.fetchStatuses(boardId).then((r) => r.response);

      emit(OffersState.success(
        offers: offersResponse.data,
        statuses: statusesResponse,
      ));
    } on DioException catch (_) {
      emit(const OffersState.failure());
    }
  }
}
