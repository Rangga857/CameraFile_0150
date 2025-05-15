import 'dart:io';

sealed class CameraEvent {}

final class InitializeCamera extends CameraEvent {}

final class SwitchCamera extends CameraEvent {}

final class ToggleFlash extends CameraEvent {}

final class TakePicture extends CameraEvent {
  final void Function(File imageFile) onPictureTaken;
  TakePicture(this.onPictureTaken);
}