import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/dto/ranking_dto.dart';
import '../../repository/ranking_repository.dart';
import '../api_resp_state.dart';

class RankingCubit extends Cubit<ResponseState> {
  final RankingRepository authRepository;

  RankingCubit(this.authRepository) : super(ResponseStateInitial());

  Future<void> getRankingDataCubit() async {
    emit(ResponseStateLoading());
    RankingDto? dto;
    try {
      dto = await authRepository.getRankingData();
      emit(ResponseStateSuccess(dto));
    } catch (error) {
      emit(const ResponseStateError("Data not found"));
    }
  }
}
