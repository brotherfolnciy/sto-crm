part of 'offers_cubit.dart';

@freezed
class OffersState with _$OffersState {
  const factory OffersState.initial() = _Initial;
  const factory OffersState.loading() = _Loading;
  const factory OffersState.success({
    required List<Offer> offers,
    required Map<String, OfferStatus> statuses,
  }) = _Success;
  const factory OffersState.failure() = _Failure;
}
