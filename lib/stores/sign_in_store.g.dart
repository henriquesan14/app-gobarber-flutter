// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStoreBase, Store {
  final _$userCredentailsAtom = Atom(name: '_SignInStoreBase.userCredentails');

  @override
  UserCredentials get userCredentails {
    _$userCredentailsAtom.context.enforceReadPolicy(_$userCredentailsAtom);
    _$userCredentailsAtom.reportObserved();
    return super.userCredentails;
  }

  @override
  set userCredentails(UserCredentials value) {
    _$userCredentailsAtom.context.conditionallyRunInAction(() {
      super.userCredentails = value;
      _$userCredentailsAtom.reportChanged();
    }, _$userCredentailsAtom, name: '${_$userCredentailsAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<dynamic> login(dynamic context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  final _$_SignInStoreBaseActionController =
      ActionController(name: '_SignInStoreBase');

  @override
  void setEmail(dynamic value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(dynamic value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'userCredentails: ${userCredentails.toString()}';
    return '{$string}';
  }
}
