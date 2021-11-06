import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vision_app/domain/use_cases/load_model_use_case.dart';

part 'tfmodel_state.dart';

class TfmodelCubit extends Cubit<TfmodelState> {
  final RunModelAIUseCase runModelAIUseCas;

  TfmodelCubit({required this.runModelAIUseCas}) : super(TfmodelInitial());

  Future<void> runTensorFlowModel(
      File imagePath, String assetModel, String assetLabels) async {
    emit(TfmodelInitial());
    try {
      emit(TfmodelLoading());
      final result = await runModelAIUseCas.call(
          image: imagePath, assetModel: assetModel, assetLabels: assetLabels);
      emit(TfmodelLoaded(result));
    } catch (e) {
      emit(TfmodelError(e.toString()));
    }
  }
}
