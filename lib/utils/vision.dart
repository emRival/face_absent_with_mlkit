import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Vision {
  // Private named constructor to implement singleton pattern
  Vision._();

  static final instance = Vision._();

  FaceDetector faceDetector([FaceDetectorOptions? options]) {
    return FaceDetector(options: options ?? FaceDetectorOptions());
  }
}
