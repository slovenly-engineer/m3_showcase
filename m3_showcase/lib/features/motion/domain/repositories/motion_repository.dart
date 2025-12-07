import '../entities/motion_demo.dart';

abstract class MotionRepository {
  List<MotionDemo> getMotionDemos();
  List<EasingDemo> getEasingDemos();
  List<DurationDemo> getDurationDemos();
}