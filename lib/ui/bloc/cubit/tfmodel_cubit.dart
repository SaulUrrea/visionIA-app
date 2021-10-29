import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vision_app/domain/use_cases/model_mascot_use_case.dart';

part 'tfmodel_state.dart';

class TfmodelCubit extends Cubit<TfmodelState> {
  final RunModelMascotUseCase runModelMascotUseCase;

  TfmodelCubit({required this.runModelMascotUseCase}) : super(TfmodelInitial());

  Future<void> runMascotModel(File imagePath) async {
    emit(TfmodelInitial());
    try {
      emit(TfmodelLoading());
      final result = await runModelMascotUseCase.runMascotModel(imagePath);
      emit(TfmodelLoaded(result));
    } catch (e) {
      emit(TfmodelError(e.toString()));
    }
  }
}
