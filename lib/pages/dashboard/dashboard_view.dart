import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_hills_app/views/dashboard/charts/bar_chart_view.dart';
import 'package:golden_hills_app/views/dashboard/charts/line_chart_view.dart';
import 'package:golden_hills_app/views/dashboard/charts/pichart_view.dart';
import 'package:golden_hills_app/widgets/app_app_bar.dart';

class DashboardView extends StatelessWidget {
  static String routeName = 'home';
  static String routePath = '/home';

  const DashboardView.router(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Dashboard',
        showNotificationIcon: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      height: 200.0,
                      width: double.infinity,
                      child: AnotherCarousel(
                        images: const [
                          ExactAssetImage("assets/3.jpg"),
                          ExactAssetImage("assets/1.jpg"),
                          ExactAssetImage("assets/3.jpg")
                        ],
                        showIndicator: true,
                        borderRadius: true,
                        dotColor: Theme.of(context).primaryColor,
                        //dotBgColor: Theme.of(context).canvasColor,
                        // moveIndicatorFromBottom: 180.0,
                        noRadiusForIndicator: false,
                        overlayShadow: true,
                        overlayShadowColors: Colors.white,
                        overlayShadowSize: 0.4,
                      )),
                ),
              ),
              Text(
                "Room Availability",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                  height: 200, width: double.infinity, child: PieChartView()),
              Text(
                "User Resgistrations",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                  height: 200, width: double.infinity, child: LineChartView()),
              Text(
                "Payment Collections",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                  height: 200, width: double.infinity, child: BarChartView()),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
