import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/controller/reports_controller/get_all_reports.dart';
import 'package:flutter_application_2/views/reports_page/barGraph/bar_graph.dart';

import 'package:lottie/lottie.dart';
class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<dynamic>monthlyEarning=[
    
  ];
  List<dynamic>monthlyProductsPayment=[
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar:AppBar(
        title: Text('Reports'),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
  body: FutureBuilder(
    future:GetAllReports().getAllReports(kTokenTest) 
  , builder: (context,snapshot){
    if(snapshot.hasData){
    dynamic data=snapshot.data['data'];
      for (var i = 0; i <data.length ; i++) {
        monthlyEarning.add(data[i]['total_sales']+0.00001 );
        monthlyProductsPayment.add(data[i]['total_quantity']+0.00001);
      }
      return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(),
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Monthly Earning for This Year",style: TextStyle(color: Colors.black,fontSize: 24),),
          ),
          Expanded(child: MyBarGraph(monthlyEarning: monthlyEarning,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Monthly Products Payment for This Year",style: TextStyle(color: Colors.black,fontSize: 20),),
          ),
          Expanded(child: Container(
            height: 100,
            decoration: BoxDecoration(),
            clipBehavior: Clip.hardEdge,
            child: MyBarGraph(monthlyEarning: monthlyProductsPayment,))),
        ],
      )),
  );
    }
    else{
      return Center(child: Lottie.asset("assets/lottie/loading_hand.json"),);
    }
  }),
    );
  }
}