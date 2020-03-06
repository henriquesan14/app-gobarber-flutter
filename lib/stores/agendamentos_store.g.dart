// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamentos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentosStore on _AgendamentosStoreBase, Store {
  final _$loadingPostAgendamentoAtom =
      Atom(name: '_AgendamentosStoreBase.loadingPostAgendamento');

  @override
  bool get loadingPostAgendamento {
    _$loadingPostAgendamentoAtom.context
        .enforceReadPolicy(_$loadingPostAgendamentoAtom);
    _$loadingPostAgendamentoAtom.reportObserved();
    return super.loadingPostAgendamento;
  }

  @override
  set loadingPostAgendamento(bool value) {
    _$loadingPostAgendamentoAtom.context.conditionallyRunInAction(() {
      super.loadingPostAgendamento = value;
      _$loadingPostAgendamentoAtom.reportChanged();
    }, _$loadingPostAgendamentoAtom,
        name: '${_$loadingPostAgendamentoAtom.name}_set');
  }

  final _$agendamentosAtom = Atom(name: '_AgendamentosStoreBase.agendamentos');

  @override
  List<Appointment> get agendamentos {
    _$agendamentosAtom.context.enforceReadPolicy(_$agendamentosAtom);
    _$agendamentosAtom.reportObserved();
    return super.agendamentos;
  }

  @override
  set agendamentos(List<Appointment> value) {
    _$agendamentosAtom.context.conditionallyRunInAction(() {
      super.agendamentos = value;
      _$agendamentosAtom.reportChanged();
    }, _$agendamentosAtom, name: '${_$agendamentosAtom.name}_set');
  }

  final _$loadingGetAgendamentosAtom =
      Atom(name: '_AgendamentosStoreBase.loadingGetAgendamentos');

  @override
  bool get loadingGetAgendamentos {
    _$loadingGetAgendamentosAtom.context
        .enforceReadPolicy(_$loadingGetAgendamentosAtom);
    _$loadingGetAgendamentosAtom.reportObserved();
    return super.loadingGetAgendamentos;
  }

  @override
  set loadingGetAgendamentos(bool value) {
    _$loadingGetAgendamentosAtom.context.conditionallyRunInAction(() {
      super.loadingGetAgendamentos = value;
      _$loadingGetAgendamentosAtom.reportChanged();
    }, _$loadingGetAgendamentosAtom,
        name: '${_$loadingGetAgendamentosAtom.name}_set');
  }

  final _$getAgendamentosAsyncAction = AsyncAction('getAgendamentos');

  @override
  Future getAgendamentos() {
    return _$getAgendamentosAsyncAction.run(() => super.getAgendamentos());
  }

  final _$postAgendamentoAsyncAction = AsyncAction('postAgendamento');

  @override
  Future postAgendamento(dynamic context, dynamic idProvider, dynamic date) {
    return _$postAgendamentoAsyncAction
        .run(() => super.postAgendamento(context, idProvider, date));
  }

  @override
  String toString() {
    final string =
        'loadingPostAgendamento: ${loadingPostAgendamento.toString()},agendamentos: ${agendamentos.toString()},loadingGetAgendamentos: ${loadingGetAgendamentos.toString()}';
    return '{$string}';
  }
}
