part of 'tfmodel_cubit.dart';

abstract class TfmodelState extends Equatable {
  const TfmodelState();
}

class TfmodelInitial extends TfmodelState {
  @override
  List<Object> get props => [];
}

class TfmodelLoading extends TfmodelState {
  @override
  List<Object> get props => [];
}

class TfmodelLoaded extends TfmodelState {
  final String label;

  TfmodelLoaded(this.label);
  @override
  List<Object> get props => [label];
}

class TfmodelError extends TfmodelState {
  final String error;

  TfmodelError(this.error);
  @override
  List<Object> get props => [];
}
