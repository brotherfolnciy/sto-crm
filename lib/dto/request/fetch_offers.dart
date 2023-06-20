// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_offers.freezed.dart';
part 'fetch_offers.g.dart';

@freezed
abstract class FetchOffersRequest with _$FetchOffersRequest {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory FetchOffersRequest({
    String? filter,
    String? sort,
    int? page,
    int? limit,
    List<String>? requiredFields,
  }) = _FetchOffersRequest;

  factory FetchOffersRequest.fromJson(Map<String, dynamic> json) =>
      _$FetchOffersRequestFromJson(json);
}
