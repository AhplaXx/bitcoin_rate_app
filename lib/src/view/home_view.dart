import 'dart:async';  // For Timer
import 'package:elementlist/src/view_models/bitcoin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startPeriodicRefresh();
  }

  void _startPeriodicRefresh() {
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      // Trigger a refresh in the BitcoinViewModel
      context.read<BitcoinViewModel>().getBitcoin();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bitcoinViewModel = context.watch<BitcoinViewModel>();

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                bitcoinViewModel.bitcoin?.chartName ?? "Loading...",
                style: TextStyle(color: Colors.yellow, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text("This data was last updated at", style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text(
                bitcoinViewModel.bitcoin?.updatedTime ?? "Loading...",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              if (bitcoinViewModel.loading) // Show CircularProgressIndicator if loading
                Center(child: CircularProgressIndicator())
              else ...[
                Text(
                  "United States Dollar: " + (bitcoinViewModel.bitcoin?.usdPrice ?? "N/A") + " \$",
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(height: 20),
                Text(
                  "United Kingdom Pound: " + (bitcoinViewModel.bitcoin?.poundPrice ?? "N/A") + " £",
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(height: 20),
                Text(
                  "Euro: " + (bitcoinViewModel.bitcoin?.euroPrice ?? "N/A") + " €",
                  style: TextStyle(fontSize: 28),
                ),
              ],
              Expanded(child: Container()),
              Text(
                bitcoinViewModel.bitcoin?.disclaimer ?? "Loading...",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
