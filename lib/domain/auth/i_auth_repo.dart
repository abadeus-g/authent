import 'package:authenticator/domain/core/constants/user.dart';
import 'package:dartz/dartz.dart';

import 'auth_failures.dart';
import 'value_objects.dart';

abstract class IAuthRepository {
  Future<Option<AbUser>> getSignedInUser();
  Future<Either<AuthFailures, Unit>> signInWithGoogle();
  Future<Either<AuthFailures, Unit>> signInWithGithub();

  Future<Either<AuthFailures, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailures, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailures, Unit>> signInWithPhone({
    required String number,
  });

  Future<void> signOut();
}
