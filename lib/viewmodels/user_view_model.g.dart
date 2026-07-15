// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'26e7a2b9e67d26e2e5a478b0e86b0933c09f87c2';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$userViewModelHash() => r'2de191d84b2c8a2b534b07fbecc86d5e165b4c10';

/// See also [UserViewModel].
@ProviderFor(UserViewModel)
final userViewModelProvider =
    AutoDisposeNotifierProvider<UserViewModel, UserState>.internal(
  UserViewModel.new,
  name: r'userViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserViewModel = AutoDisposeNotifier<UserState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
