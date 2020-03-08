// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStoreBase, Store {
  final _$userUpdateAtom = Atom(name: '_ProfileStoreBase.userUpdate');

  @override
  UserUpdate get userUpdate {
    _$userUpdateAtom.context.enforceReadPolicy(_$userUpdateAtom);
    _$userUpdateAtom.reportObserved();
    return super.userUpdate;
  }

  @override
  set userUpdate(UserUpdate value) {
    _$userUpdateAtom.context.conditionallyRunInAction(() {
      super.userUpdate = value;
      _$userUpdateAtom.reportChanged();
    }, _$userUpdateAtom, name: '${_$userUpdateAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_ProfileStoreBase.loading');

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

  final _$updateUserAsyncAction = AsyncAction('updateUser');

  @override
  Future updateUser(dynamic context) {
    return _$updateUserAsyncAction.run(() => super.updateUser(context));
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase');

  @override
  void logout(dynamic context) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.logout(context);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(dynamic value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(dynamic value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOldPassword(dynamic value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.setOldPassword(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(dynamic value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmPassword(dynamic value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateName(dynamic value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.validateName(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateEmail(dynamic value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.validateEmail(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'userUpdate: ${userUpdate.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
