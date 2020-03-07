// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$authStatusAtom = Atom(name: '_AuthStoreBase.authStatus');

  @override
  AuthStatus get authStatus {
    _$authStatusAtom.context.enforceReadPolicy(_$authStatusAtom);
    _$authStatusAtom.reportObserved();
    return super.authStatus;
  }

  @override
  set authStatus(AuthStatus value) {
    _$authStatusAtom.context.conditionallyRunInAction(() {
      super.authStatus = value;
      _$authStatusAtom.reportChanged();
    }, _$authStatusAtom, name: '${_$authStatusAtom.name}_set');
  }

  final _$userAtom = Atom(name: '_AuthStoreBase.user');

  @override
  User get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_AuthStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$getStatusAsyncAction = AsyncAction('getStatus');

  @override
  Future getStatus() {
    return _$getStatusAsyncAction.run(() => super.getStatus());
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  @override
  String toString() {
    final string =
        'authStatus: ${authStatus.toString()},user: ${user.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
