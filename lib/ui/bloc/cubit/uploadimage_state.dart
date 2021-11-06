part of 'uploadimage_cubit.dart';

abstract class UploadimageState extends Equatable {
  const UploadimageState();

  @override
  List<Object> get props => [];
}

class UploadimageInitial extends UploadimageState {}

class UploadFailure extends UploadimageState {
  @override
  List<Object> get props => [];
}

class UploadingImage extends UploadimageState {
  @override
  List<Object> get props => [];
}

class UploadedImage extends UploadimageState {
  final String url;
  const UploadedImage(this.url);
  @override
  List<Object> get props => [url];
}
