import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:lab4/logic/dice_state.dart';
class DiceCubit extends Cubit<DiceState> {
  int sum=0;
  int num1=0;
  int num2=0;
  DiceCubit() : super(DiceInitial());
     add(){
      emit(DiceLoading());
    final random=Random();
    num1=random.nextInt(6);
    num2=random.nextInt(6);
      sum=num1+num2;
      List data=[num1,num2,sum];
    emit(DiceSuccess(data));
   }
}