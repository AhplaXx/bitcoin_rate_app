import 'dart:convert';


class BitcoinModel{

  final String updatedTime;
  final String disclaimer;
  final String chartName;
  final String usdPrice;
  final String poundPrice;
  final String euroPrice;


  BitcoinModel({required this.chartName, required this.disclaimer,required this.euroPrice,required this.poundPrice, required this.updatedTime, required this.usdPrice});




  factory BitcoinModel.fromJson(Map<String, dynamic> json) {
    return BitcoinModel(
      updatedTime: json['time']['updated'],
      disclaimer: json['disclaimer'],
      chartName: json['chartName'],
      usdPrice: json['bpi']['USD']['rate'],
      poundPrice: json['bpi']['GBP']['rate'],
      euroPrice: json['bpi']['EUR']['rate'],
    );
  }




}