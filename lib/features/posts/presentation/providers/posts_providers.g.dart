// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'2d6e035b6bf9da3fe24dafecb57758f049039114';

@ProviderFor(httpClient)
final httpClientProvider = HttpClientProvider._();

final class HttpClientProvider
    extends $FunctionalProvider<http.Client, http.Client, http.Client>
    with $Provider<http.Client> {
  HttpClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpClientHash();

  @$internal
  @override
  $ProviderElement<http.Client> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  http.Client create(Ref ref) {
    return httpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(http.Client value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<http.Client>(value),
    );
  }
}

String _$httpClientHash() => r'3e1d65fa831165b685a1881b712e31312635f7c7';

@ProviderFor(internetConnectionChecker)
final internetConnectionCheckerProvider = InternetConnectionCheckerProvider._();

final class InternetConnectionCheckerProvider
    extends
        $FunctionalProvider<
          InternetConnectionChecker,
          InternetConnectionChecker,
          InternetConnectionChecker
        >
    with $Provider<InternetConnectionChecker> {
  InternetConnectionCheckerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internetConnectionCheckerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internetConnectionCheckerHash();

  @$internal
  @override
  $ProviderElement<InternetConnectionChecker> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InternetConnectionChecker create(Ref ref) {
    return internetConnectionChecker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InternetConnectionChecker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InternetConnectionChecker>(value),
    );
  }
}

String _$internetConnectionCheckerHash() =>
    r'f5ee3d437100cee5ecc79a1ff857b1e83b09867b';

@ProviderFor(networkInfo)
final networkInfoProvider = NetworkInfoProvider._();

final class NetworkInfoProvider
    extends $FunctionalProvider<NetworkInfo, NetworkInfo, NetworkInfo>
    with $Provider<NetworkInfo> {
  NetworkInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkInfoHash();

  @$internal
  @override
  $ProviderElement<NetworkInfo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkInfo create(Ref ref) {
    return networkInfo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkInfo>(value),
    );
  }
}

String _$networkInfoHash() => r'20f178205cce669dac88b3a489a9a4fb83055deb';

@ProviderFor(postRemoteDataSource)
final postRemoteDataSourceProvider = PostRemoteDataSourceProvider._();

final class PostRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          PostRemoteDataSource,
          PostRemoteDataSource,
          PostRemoteDataSource
        >
    with $Provider<PostRemoteDataSource> {
  PostRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<PostRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PostRemoteDataSource create(Ref ref) {
    return postRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostRemoteDataSource>(value),
    );
  }
}

String _$postRemoteDataSourceHash() =>
    r'37c64edacbd3f75a38b75442834c3c9cf2bf9938';

@ProviderFor(postLocalDataSource)
final postLocalDataSourceProvider = PostLocalDataSourceProvider._();

final class PostLocalDataSourceProvider
    extends
        $FunctionalProvider<
          PostLocalDataSource,
          PostLocalDataSource,
          PostLocalDataSource
        >
    with $Provider<PostLocalDataSource> {
  PostLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<PostLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PostLocalDataSource create(Ref ref) {
    return postLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostLocalDataSource>(value),
    );
  }
}

String _$postLocalDataSourceHash() =>
    r'901f9e4ec1a8e8750da0be8ba5486648f243018e';

@ProviderFor(postsRepository)
final postsRepositoryProvider = PostsRepositoryProvider._();

final class PostsRepositoryProvider
    extends
        $FunctionalProvider<PostsRepository, PostsRepository, PostsRepository>
    with $Provider<PostsRepository> {
  PostsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsRepositoryHash();

  @$internal
  @override
  $ProviderElement<PostsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostsRepository create(Ref ref) {
    return postsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostsRepository>(value),
    );
  }
}

String _$postsRepositoryHash() => r'e6a2096fe701add955084c5ff5367ea9a9ced152';

@ProviderFor(getAllPostsUsecase)
final getAllPostsUsecaseProvider = GetAllPostsUsecaseProvider._();

final class GetAllPostsUsecaseProvider
    extends
        $FunctionalProvider<
          GetAllPostsUsecase,
          GetAllPostsUsecase,
          GetAllPostsUsecase
        >
    with $Provider<GetAllPostsUsecase> {
  GetAllPostsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllPostsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllPostsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetAllPostsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAllPostsUsecase create(Ref ref) {
    return getAllPostsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAllPostsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAllPostsUsecase>(value),
    );
  }
}

String _$getAllPostsUsecaseHash() =>
    r'6c722b1808f42f0b60b1342022a51fa7269be166';

@ProviderFor(addPostUsecase)
final addPostUsecaseProvider = AddPostUsecaseProvider._();

final class AddPostUsecaseProvider
    extends $FunctionalProvider<AddPostUsecase, AddPostUsecase, AddPostUsecase>
    with $Provider<AddPostUsecase> {
  AddPostUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addPostUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addPostUsecaseHash();

  @$internal
  @override
  $ProviderElement<AddPostUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddPostUsecase create(Ref ref) {
    return addPostUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddPostUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddPostUsecase>(value),
    );
  }
}

String _$addPostUsecaseHash() => r'236ee9bcd54276061c98231e1f0e41547567b1db';

@ProviderFor(updatePostUsecase)
final updatePostUsecaseProvider = UpdatePostUsecaseProvider._();

final class UpdatePostUsecaseProvider
    extends
        $FunctionalProvider<
          UpdatePostUsecase,
          UpdatePostUsecase,
          UpdatePostUsecase
        >
    with $Provider<UpdatePostUsecase> {
  UpdatePostUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updatePostUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updatePostUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdatePostUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdatePostUsecase create(Ref ref) {
    return updatePostUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdatePostUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdatePostUsecase>(value),
    );
  }
}

String _$updatePostUsecaseHash() => r'b7dc2d307eae4c15313ad1f7c3153425c2ecab6a';

@ProviderFor(deletePostUsecase)
final deletePostUsecaseProvider = DeletePostUsecaseProvider._();

final class DeletePostUsecaseProvider
    extends
        $FunctionalProvider<
          DeletePostUsecase,
          DeletePostUsecase,
          DeletePostUsecase
        >
    with $Provider<DeletePostUsecase> {
  DeletePostUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deletePostUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deletePostUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeletePostUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeletePostUsecase create(Ref ref) {
    return deletePostUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeletePostUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeletePostUsecase>(value),
    );
  }
}

String _$deletePostUsecaseHash() => r'a2a5ec763e2608f19ff491bf3bb03894885e8bdb';
