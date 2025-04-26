import 'package:bloc/bloc.dart';
import 'package:his_mobile/features/profile/data/datasources/user_datasource.dart';
import 'package:his_mobile/features/profile/presentation/user_info_bloc/user_info_event.dart';
import 'package:his_mobile/features/profile/presentation/user_info_bloc/user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserDataSource userDataSource;

  UserInfoBloc(this.userDataSource) : super(UserInfoInitial()) {
    on<UserInfoEvent>((event, emit) {});
    on<ToggleUserInfoUpdate>((event, emit) {
      emit(UserInfoUpdating(event.isUpdating));
    });
    on<UserInfoLoad>(_onProfileViewed);
    on<UserInfoUpdate>(_onProfileUpdated);
  }

  Future<void> _onProfileViewed(
    UserInfoLoad event,
    Emitter<UserInfoState> emit,
  ) async {
    try {
      emit(UserInfoLoading());
      final userInfo = await userDataSource.getUserDetails();
      emit(UserInfoLoaded(userInfo));
    } catch (e) {
      emit(UserInfoError(e.toString()));
    }
  }

  Future<void> _onProfileUpdated(
    UserInfoUpdate event,
    Emitter<UserInfoState> emit,
  ) async {
    try {
      emit(UserInfoUpdating(true));

      // Update user data through the data source
      final updatedUser =
          await userDataSource.updateUserDetails(user: event.user);

      // Emit the updated user data
      emit(UserInfoLoaded(updatedUser, isEditing: false));

      // Optionally emit updating complete state
      emit(UserInfoUpdating(false));
    } catch (e) {
      emit(UserInfoUpdating(false));
      emit(UserInfoError(e.toString()));
      // Re-emit the current state if you want to keep the old data visible
      if (state is UserInfoLoaded) {
        emit(UserInfoLoaded((state as UserInfoLoaded).user, isEditing: true));
      }
    }
  }
}
