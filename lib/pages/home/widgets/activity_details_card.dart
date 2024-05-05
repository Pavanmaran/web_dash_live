import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/model/health_model.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_svg/svg.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  // final List<HealthModel> healthDetails = const [
  //   HealthModel(
  //       icon: 'assets/svg/burn.svg', value: "305°C", title: "Temperature"),
  //   HealthModel_New(icon: Icon(icons.thermostat), value: "65%", title: "Humidity"),
  //   HealthModel(
  //       icon: 'assets/svg/distance.svg', value: "7km", title: "Distance"),
  //   HealthModel(icon: 'assets/svg/sleep.svg', value: "7h48m", title: "Sleep"),
  // ];

  final List<HealthModel_New> healthDetails = const [
    HealthModel_New(
        icon: Icon(Icons.thermostat), value: "305°C", title: "Temperature"),
    HealthModel_New(
        icon: Icon(Icons.water_drop), value: "65%", title: "Humidity"),
    HealthModel_New(
        // add icon of bulb
        icon: Icon(Icons.lightbulb),
        value: "12.5V",
        title: "Voltage"),
    HealthModel_New(icon: Icon(Icons.power), value: "126W", title: "Energy"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              healthDetails[i].icon,
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  healthDetails[i].value,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                healthDetails[i].title,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      },
    );
  }
}
