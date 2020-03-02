// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashBoardStore on _DashBoardStoreBase, Store {
  final _$currentPageAtom = Atom(name: '_DashBoardStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.context.enforceReadPolicy(_$currentPageAtom);
    _$currentPageAtom.reportObserved();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.context.conditionallyRunInAction(() {
      super.currentPage = value;
      _$currentPageAtom.reportChanged();
    }, _$currentPageAtom, name: '${_$currentPageAtom.name}_set');
  }

  final _$_DashBoardStoreBaseActionController =
      ActionController(name: '_DashBoardStoreBase');

  @override
  void setPage(dynamic context, dynamic index) {
    final _$actionInfo = _$_DashBoardStoreBaseActionController.startAction();
    try {
      return super.setPage(context, index);
    } finally {
      _$_DashBoardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'currentPage: ${currentPage.toString()}';
    return '{$string}';
  }
}
