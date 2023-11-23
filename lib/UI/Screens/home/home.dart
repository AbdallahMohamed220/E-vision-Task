import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/space.dart';
import '../../../utils/navigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Home Screen'),
            ),
            const VSpace(10),
            const Center(
              child: Text('Welcome User'),
            ),
            const VSpace(100),
            CustomElevatedButton(
              butWidth: 200,
              label: 'Logout',
              onPressed: () {
                AppNavigation.signOut(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
