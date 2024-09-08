import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab4/logic/dice_cubit.dart';
import 'package:lab4/logic/dice_state.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return Scaffold(body:BlocBuilder<DiceCubit,DiceState>(
         
          builder: (context,state) {
            if(state is DiceLoading){
             return const Center(child:CircularProgressIndicator() ,);}
             else if(state is DiceSuccess){
              return Stack(
                children: [
                  Image.asset("images/green-artificial-grass-textured-background.jpg"
                  , height: size.height,
                  width: size.width, // Ensure it takes the full width too
                  fit: BoxFit.cover,)
                  ,Column(
                    mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    const  Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text(" Click to roll",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight:FontWeight.w700
                        ),),
                      ),
                         Padding(
                           padding: const EdgeInsets.only(bottom:15.0),
                           child: Text(" Sum is ${state.data[2]}",style:const TextStyle(
                                                 fontSize: 20,
                                                 color: Colors.white,
                                                 fontWeight:FontWeight.w500
                                               )),
                         ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 100,
                              height:100,
                                child: SvgPicture.asset("images/d${state.data[0]}.svg")),
                                 SizedBox(
                                  width: 100,
                              height:100
                                  ,child: SvgPicture.asset("images/d${state.data[1]}.svg")),
                            ],
                          ),
                       
                          Padding(
                            padding: const EdgeInsets.only(top:15),
                            child: SizedBox(
                               width: 120,
                                                height: 50,
                              child: ElevatedButton(onPressed:(){
                                           BlocProvider.of<DiceCubit>(context).add();
                                          } ,style: ElevatedButton.styleFrom(
                                backgroundColor:const Color.fromARGB(255, 243, 70, 70),
                                padding: const EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                              ) 
                                          ,child:const Text("Roll",style:TextStyle(
                                            fontSize:15
                                          ))),
                            ),
                          )
                    ],
                  ),
                ],
              );
             }else{
              return const Center(child: Text("error"),);
             }
            
          }
        ),
       
      
     );
  }
  
 
}