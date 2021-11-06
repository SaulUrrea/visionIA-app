import 'dart:io';

abstract class TFliteRepository {
  Future<String> runTensorFlowModel(
      {required File image,
      required String assetModel,
      required String assetLabels});
}
