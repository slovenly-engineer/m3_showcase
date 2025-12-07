import '../entities/motion_demo.dart';
import '../repositories/motion_repository.dart';

class GetMotionDemosUseCase {
  final MotionRepository repository;

  GetMotionDemosUseCase(this.repository);

  List<MotionDemo> execute() {
    return repository.getMotionDemos();
  }
}

class GetEasingDemosUseCase {
  final MotionRepository repository;

  GetEasingDemosUseCase(this.repository);

  List<EasingDemo> execute() {
    return repository.getEasingDemos();
  }
}

class GetDurationDemosUseCase {
  final MotionRepository repository;

  GetDurationDemosUseCase(this.repository);

  List<DurationDemo> execute() {
    return repository.getDurationDemos();
  }
}