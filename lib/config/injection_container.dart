import 'package:get_it/get_it.dart';
import 'package:vision_app/domain/use_cases/model_mascot_use_case.dart';
import 'package:vision_app/ui/bloc/cubit/tfmodel_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  sl.registerFactory<TfmodelCubit>(
      () => TfmodelCubit(runModelMascotUseCase: sl.call()));
  //Use Case
  sl.registerLazySingleton(() => RunModelMascotUseCase());
}
