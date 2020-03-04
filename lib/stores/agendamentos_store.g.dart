// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamentos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentosStore on _AgendamentosStoreBase, Store {
  final _$providersAtom = Atom(name: '_AgendamentosStoreBase.providers');

  @override
  List<Provider> get providers {
    _$providersAtom.context.enforceReadPolicy(_$providersAtom);
    _$providersAtom.reportObserved();
    return super.providers;
  }

  @override
  set providers(List<Provider> value) {
    _$providersAtom.context.conditionallyRunInAction(() {
      super.providers = value;
      _$providersAtom.reportChanged();
    }, _$providersAtom, name: '${_$providersAtom.name}_set');
  }

  final _$getProvidersAsyncAction = AsyncAction('getProviders');

  @override
  Future getProviders() {
    return _$getProvidersAsyncAction.run(() => super.getProviders());
  }

  @override
  String toString() {
    final string = 'providers: ${providers.toString()}';
    return '{$string}';
  }
}
