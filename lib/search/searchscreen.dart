import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/component.dart';
import '../sharedcubit/cubit/cubit.dart';
import '../sharedcubit/cubit/states.dart';

class searchscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return BlocProvider(
      create: (context)=>NewsCubit(),
      child: BlocConsumer<NewsCubit , NewsState>(
        listener: (context , state){},
        builder: (context , state){
          List list = NewsCubit.get(context).Search ;
          return Scaffold(
            appBar: AppBar(),
            body:Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller:NewsCubit.get(context).searchController,
                    style: Theme.of(context).textTheme.bodyText2,

                    decoration: InputDecoration(
                        labelText: "Search" ,
                        border: OutlineInputBorder() ,
                        prefixIcon: Icon(Icons.search)
                    ),
                    onChanged: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                      // if(NewsCubit.get(context).Search.length >0)
                      // searchController.text = value ;
                      NewsCubit.get(context).TFFChange(value);
                    },
                  ),
                  SizedBox(height: 25,) ,

                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context , index)=>BuildApiItem(list[index] ,context),
                        separatorBuilder: (context , index)=> MyDivider(),
                        itemCount: list.length),
                  )

                ],),
            )
          );
        },


      )
  );
  }
}
