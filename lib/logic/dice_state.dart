abstract class DiceState{}
class DiceInitial extends DiceState{}
class DiceSuccess extends DiceState{
  List data;
  DiceSuccess( this.data);
}
class DiceLoading extends DiceState{}
class DiceFailure extends DiceState{
  DiceFailure(String error);
}