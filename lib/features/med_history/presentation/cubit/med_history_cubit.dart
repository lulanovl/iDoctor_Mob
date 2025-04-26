import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'med_history_state.dart';

class MedHistoryCubit extends Cubit<MedHistoryState> {
  MedHistoryCubit() : super(MedHistoryInitial());
}
