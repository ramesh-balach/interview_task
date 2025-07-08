import 'package:flutter/material.dart';
import 'package:interview_task/res/app_assets.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/action_button.dart';
import 'package:interview_task/view/widgets/balance_card.dart';
import 'package:interview_task/view/widgets/mining_stats_chart.dart';
import 'package:interview_task/view/widgets/statistic_card.dart';
import 'package:interview_task/view/widgets/stock_chart.dart';
import 'package:interview_task/view/widgets/welcome_bar.dart';

import '../../widgets/mining_header_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(18.w),
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    // Welcome Bar
                    WelcomeBar(),
                    Gap.v(20),
                    // Balance Card
                    BalanceCard(),
                    Gap.v(20),
                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionButton(icon: AppAssets.sendIcon, title: 'Send', onTap: (){},),
                        ActionButton(icon: AppAssets.receiveIcon, title: 'Receive', onTap: (){},),
                        ActionButton(icon: AppAssets.historyIcon, title: 'History', onTap: (){},),
                      ],
                    ),
                    Gap.v(20),
                    // Mining Header Card and Stats Chart
                    MiningHeaderCard(balance: '12,000.000',),
                    MiningStatsChart(),
                    Gap.v(20),
                    StatisticCard(),
                    Gap.v(20),
                    StockChart()
                  ]),
            ),
          )),
    );
  }
}
