abstract class HomeStates{}

class InitialStates extends HomeStates{}

class ChangeBottomIndex extends HomeStates{}

class homemodelstat extends HomeStates{}

class homemodelerrorstat extends HomeStates{}


class datamodelstat extends HomeStates{}

class datamodelerrorstat extends HomeStates{}

class datafavestat extends HomeStates{}

class datafavsuccessestat extends HomeStates{}

class datafaverrorstat extends HomeStates{}

class datagetfavsuccessestat extends HomeStates{}

class datagetfaverrorstat extends HomeStates{}

class LoadingFavScreen extends HomeStates{}

class userssuccessestat extends HomeStates{}

class usserserrorstat extends HomeStates{}

class LoadingSettingsScreen extends HomeStates{}

class tokendeleted extends HomeStates{}

class UpdateError extends HomeStates{
  final String error;

  UpdateError(this.error);
}

class UpdateSuccess extends HomeStates{}

class UpdateLoading extends HomeStates{}

class LogoutError extends HomeStates{
 final String error;
  LogoutError(this.error);
}

class LogoutSuccess extends HomeStates{}



