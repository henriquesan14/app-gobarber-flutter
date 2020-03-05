// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HorarioStore on _HorarioStoreBase, Store {
  Computed<String> _$dataFormadaComputed;

  @override
  String get dataFormada =>
      (_$dataFormadaComputed ??= Computed<String>(() => super.dataFormada))
          .value;

  final _$dataSelecionadaAtom = Atom(name: '_HorarioStoreBase.dataSelecionada');

  @override
  DateTime get dataSelecionada {
    _$dataSelecionadaAtom.context.enforceReadPolicy(_$dataSelecionadaAtom);
    _$dataSelecionadaAtom.reportObserved();
    return super.dataSelecionada;
  }

  @override
  set dataSelecionada(DateTime value) {
    _$dataSelecionadaAtom.context.conditionallyRunInAction(() {
      super.dataSelecionada = value;
      _$dataSelecionadaAtom.reportChanged();
    }, _$dataSelecionadaAtom, name: '${_$dataSelecionadaAtom.name}_set');
  }

  final _$horariosAtom = Atom(name: '_HorarioStoreBase.horarios');

  @override
  List<Horario> get horarios {
    _$horariosAtom.context.enforceReadPolicy(_$horariosAtom);
    _$horariosAtom.reportObserved();
    return super.horarios;
  }

  @override
  set horarios(List<Horario> value) {
    _$horariosAtom.context.conditionallyRunInAction(() {
      super.horarios = value;
      _$horariosAtom.reportChanged();
    }, _$horariosAtom, name: '${_$horariosAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_HorarioStoreBase.loading');

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

  final _$getHorariosAsyncAction = AsyncAction('getHorarios');

  @override
  Future getHorarios(dynamic idPrestador) {
    return _$getHorariosAsyncAction.run(() => super.getHorarios(idPrestador));
  }

  final _$_HorarioStoreBaseActionController =
      ActionController(name: '_HorarioStoreBase');

  @override
  void setDataSelecionada(dynamic value) {
    final _$actionInfo = _$_HorarioStoreBaseActionController.startAction();
    try {
      return super.setDataSelecionada(value);
    } finally {
      _$_HorarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'dataSelecionada: ${dataSelecionada.toString()},horarios: ${horarios.toString()},loading: ${loading.toString()},dataFormada: ${dataFormada.toString()}';
    return '{$string}';
  }
}
