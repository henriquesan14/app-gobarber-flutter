// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStoreBase, Store {
  final _$userRegisterAtom = Atom(name: '_SignUpStoreBase.userRegister');

  @override
  UserRegister get userRegister {
    _$userRegisterAtom.context.enforceReadPolicy(_$userRegisterAtom);
    _$userRegisterAtom.reportObserved();
    return super.userRegister;
  }

  @override
  set userRegister(UserRegister value) {
    _$userRegisterAtom.context.conditionallyRunInAction(() {
      super.userRegister = value;
      _$userRegisterAtom.reportChanged();
    }, _$userRegisterAtom, name: '${_$userRegisterAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_SignUpStoreBase.loading');

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

  final _$registerAsyncAction = AsyncAction('register');

  @override
  Future<dynamic> register(dynamic context) {
    return _$registerAsyncAction.run(() => super.register(context));
  }

  final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase');

  @override
  void setNome(dynamic value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(dynamic value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(dynamic value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'userRegister: ${userRegister.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
