import 'package:elementlist/src/view_models/bitcoin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    BitcoinViewModel bitcoinViewModel = context.watch<BitcoinViewModel>();
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,


            children: [
              SizedBox(height: 40,),
              Text(bitcoinViewModel.bitcoin!.chartName + " Rate",style: TextStyle(color: Colors.yellow,fontSize: 32,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("This data was last updated at",style: TextStyle(fontSize: 24),),
              SizedBox(height: 10,),
              Text(bitcoinViewModel.bitcoin!.updatedTime,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("United States Dollar: " + bitcoinViewModel.bitcoin!.usdPrice + " \$",style: TextStyle(fontSize: 28),),
              SizedBox(height: 20,),
              Text("United Kingdom Pound: " + bitcoinViewModel.bitcoin!.poundPrice + " £",style: TextStyle(fontSize: 28),),
              SizedBox(height: 20,),
              Text("Euro: " + bitcoinViewModel.bitcoin!.euroPrice + " €",style: TextStyle(fontSize: 28),),
              Expanded(child: Container()),
              Text(bitcoinViewModel.bitcoin!.disclaimer,style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),

    );
  }
}
