// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

@freezed
class OffersResponse with _$OffersResponse {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory OffersResponse({
    required Response response,
    bool? message,
    int? code,
    String? calcRowsNotAvailableForCurrentLimit,
    double? systemExecTime,
  }) = _OffersResponse;

  factory OffersResponse.fromJson(Map<String, dynamic> json) =>
      _$OffersResponseFromJson(json);
}

@freezed
class Response with _$Response {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory Response({
    required List<Offer> data,
    int? totalCount,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@freezed
class Offer with _$Offer {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory Offer({
    bool? callDisposition,
    int? customerRequisiteId,
    int? customerLegalEntityId,
    int? customerLegalEntityRequisiteId,
    String? payerType,
    String? payerData,
    bool? payerRequisiteId,
    int? offerDateCreateFrontendTimestamp,
    int? offerStatusUpdateFrontendTimestamp,
    bool? offerFirstCompleteStatusDateFrontendTimestamp,
    dynamic offerFirstFinalStatusFrontendTimestamp,
    bool? offerStatusDateFrontendTimestamp,
    int? offerDateUpdateFrontendTimestamp,
    String? statusName,
    dynamic statusReasonName,
    String? offerCustomerName,
    String? offerFirstResponsible,
    int? offerFirstResponsibleId,
    bool? carMileage,
    bool? carOwner,
    bool? carMarkName,
    bool? carModelName,
    String? cityName,
    int? segmentId,
    String? segmentName,
    String? contactTitle,
    bool? contactSourceId,
    String? paymentStatus,
    int? paymentStatusId,
    String? offerSum,
    String? offerBalance,
    bool? calendarRecordDateFrom,
    bool? calendarRecordDateTo,
    int? workCount,
    bool? carYear,
    bool? carTitle,
    bool? carProfileVin,
    String? contactPropertyPhone,
    int? offerTaskCount,
    int? customerId,
    int? boardId,
    int? offerStatusId,
    dynamic tagsFront,
    dynamic statusReason,
    int? contactId,
    bool? carProfileId,
    String? licensePlateDivided,
    int? offerResponsibleId,
    bool? callStatesValue,
    bool? offerLastCall,
    String? frontColor,
    String? balanceCash,
    String? balanceBankCard,
    String? balanceBlackCash,
    String? balanceBlackBankCard,
    String? balanceCashless,
    int? offerId,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
