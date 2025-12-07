import '../../domain/entities/motion_demo.dart';
import '../../domain/repositories/motion_repository.dart';
import '../datasources/motion_local_datasource.dart';

class MotionRepositoryImpl implements MotionRepository {
  final MotionLocalDataSource dataSource;

  MotionRepositoryImpl(this.dataSource);

  @override
  List<MotionDemo> getMotionDemos() {
    return dataSource.getMotionDemos();
  }

  @override
  List<EasingDemo> getEasingDemos() {
    return dataSource.getEasingDemos();
  }

  @override
  List<DurationDemo> getDurationDemos() {
    return dataSource.getDurationDemos();
  }
}