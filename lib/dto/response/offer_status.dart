// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_status.freezed.dart';
part 'offer_status.g.dart';

@freezed
class StatusesResponse with _$StatusesResponse {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory StatusesResponse({
    required Map<String, OfferStatus> response,
    bool? message,
    int? code,
    double? systemExecTime,
  }) = _StatusesResponse;

  factory StatusesResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusesResponseFromJson(json);
}

@freezed
class OfferStatus with _$OfferStatus {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory OfferStatus({
    int? statusId,
    int? boardId,
    String? visualType,
    String? title,
    String? frontColor,
    List<int>? goodStatuses,
    String? isNew,
    String? isFinal,
    String? active,
    int? sort,
    dynamic events,
    String? toHide,
    String? noDelete,
    bool? systemAlias,
    List<VisualField>? visualFields,
    dynamic reasons,
  }) = _OfferStatus;

  factory OfferStatus.fromJson(Map<String, dynamic> json) =>
      _$OfferStatusFromJson(json);
}

@freezed
class Event with _$Event {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory Event({
    String? needReserve,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
class Reason with _$Reason {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory Reason({
    int? reasonId,
    String? name,
    String? reasonDefault,
    String? needComment,
    String? needDate,
    int? statusId,
    int? boardId,
    String? active,
    int? sort,
    String? needNotification,
    int? needNotificationMinutes,
    int? hodlId,
  }) = _Reason;

  factory Reason.fromJson(Map<String, dynamic> json) => _$ReasonFromJson(json);
}

@freezed
class VisualField with _$VisualField {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory VisualField({
    String? fieldName,
    int? sectionId,
  }) = _VisualField;

  factory VisualField.fromJson(Map<String, dynamic> json) =>
      _$VisualFieldFromJson(json);
}
