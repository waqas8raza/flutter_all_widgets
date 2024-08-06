import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/text_fields/app_text_field.dart';

class UserInfoView extends StatelessWidget {
  static String routeName = 'users/userinfo';
  static String routePath = 'users/userinfo';
  UserInfoView.router(BuildContext context, GoRouterState state, {super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final cnicController = TextEditingController();
  final phoneController = TextEditingController();

  List<String> title = <String>[
    'Down Payment',
    'Digging Payment',
  ];
  List<String> months = <String>[
    'January',
    'February',
  ];
  List<String> subtitle = <String>[
    '350000',
    '500000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'User INFO',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person),
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextFormField(
                controller: firstNameController,
                readOnly: true,
                hintText: 'First name',
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                controller: lastNameController,
                readOnly: true,
                hintText: 'Last name',
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                controller: emailController,
                readOnly: true,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                controller: cnicController,
                readOnly: true,
                hintText: 'CNIC',
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                controller: phoneController,
                readOnly: true,
                hintText: 'Phone',
              ),
              Text(
                'Payments',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              cardListView(
                  subtitle: subtitle,
                  title: title,
                  widget: const Text("Payment info"),
                  iconData: Icons.payments,
                  itemCount: title.length),
              Text(
                'Monthly Instalments',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              cardListView(
                  subtitle: subtitle,
                  title: months,
                  widget: const Text("Instalment info"),
                  iconData: Icons.payments,
                  itemCount: title.length),
              Text(
                'Remaining Payments',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class cardListView extends StatelessWidget {
  final int itemCount;
  final List title;
  final List subtitle;
  final Widget widget;

  final IconData? iconData;
  const cardListView({
    required this.subtitle,
    required this.title,
    required this.widget,
    required this.itemCount,
    this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          child: ExpansionTile(
            shape: const Border(),
            leading: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Icon(iconData),
              ),
            ),
            title: Text(title[index].toString()),
            subtitle: Text(subtitle[index]),
            // trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
