abstract class NewsStates{}

class InitialStates extends NewsStates{}

class ChangeIndex extends NewsStates{}

class SuccessBusinessState extends NewsStates{}

class ErrorBusinessState extends NewsStates{
  final String error;
  ErrorBusinessState(this.error);
}

class SuccessSearchState extends NewsStates{}

class Loadingcircular extends NewsStates{}

class changemoodlight extends NewsStates{}

class changemooddark extends NewsStates{}

class ErrorSearchState extends NewsStates{
  final String error;
  ErrorSearchState(this.error);
}


