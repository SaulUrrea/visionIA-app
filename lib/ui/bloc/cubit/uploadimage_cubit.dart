import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vision_app/domain/use_cases/upload_image_use_case.dart';
part 'uploadimage_state.dart';

class UploadimageCubit extends Cubit<UploadimageState> {
  final UploadImageUseCase uploadImageUseCase;

  UploadimageCubit({required this.uploadImageUseCase})
      : super(UploadimageInitial());
  Future<void> uploadImage({required File image}) async {
    try {
      emit(UploadingImage());
      final url = await uploadImageUseCase.call(image);
      emit(UploadedImage(url));
    } on SocketException catch (_) {
      emit(UploadFailure());
    } catch (_) {
      emit(UploadFailure());
    }
  }
}
