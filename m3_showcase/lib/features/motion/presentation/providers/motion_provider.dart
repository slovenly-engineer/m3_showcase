import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/motion_demo.dart';
import '../../domain/usecases/get_motion_demos_usecase.dart';
import '../../domain/repositories/motion_repository.dart';
import '../../data/repositories/motion_repository_impl.dart';
import '../../data/datasources/motion_local_datasource.dart';

final motionDataSourceProvider = Provider<MotionLocalDataSource>((ref) {
  return MotionLocalDataSource();
});

final motionRepositoryProvider = Provider<MotionRepository>((ref) {
  final dataSource = ref.read(motionDataSourceProvider);
  return MotionRepositoryImpl(dataSource);
});

final getMotionDemosUseCaseProvider = Provider<GetMotionDemosUseCase>((ref) {
  final repository = ref.read(motionRepositoryProvider);
  return GetMotionDemosUseCase(repository);
});

final getEasingDemosUseCaseProvider = Provider<GetEasingDemosUseCase>((ref) {
  final repository = ref.read(motionRepositoryProvider);
  return GetEasingDemosUseCase(repository);
});

final getDurationDemosUseCaseProvider = Provider<GetDurationDemosUseCase>((ref) {
  final repository = ref.read(motionRepositoryProvider);
  return GetDurationDemosUseCase(repository);
});

final motionDemosProvider = Provider<List<MotionDemo>>((ref) {
  final useCase = ref.read(getMotionDemosUseCaseProvider);
  return useCase.execute();
});

final easingDemosProvider = Provider<List<EasingDemo>>((ref) {
  final useCase = ref.read(getEasingDemosUseCaseProvider);
  return useCase.execute();
});

final durationDemosProvider = Provider<List<DurationDemo>>((ref) {
  final useCase = ref.read(getDurationDemosUseCaseProvider);
  return useCase.execute();
});