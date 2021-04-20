import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_object.dart';

part 'user.freezed.dart';

@freezed
class AbUser with _$AbUser {
  const factory AbUser({required UniqueId id}) = _AbUser;
}
