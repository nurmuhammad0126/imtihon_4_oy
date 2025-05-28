import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_names.dart';
import '../../../../core/service/user_local_service.dart';
import '../../../auth/data/datasource/auth_remote_datasource.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            UserLocalService().removeUser();
            await AuthRemoteDatasource().signOut();
            if (context.mounted) {
              context.go(AppNames.splash);
            }
          },
          icon: Icon(Icons.logout),
        ),
      ),
    );
  }
}
