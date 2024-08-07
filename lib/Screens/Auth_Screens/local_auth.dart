import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth extends StatefulWidget {
  const LocalAuth({super.key});

  @override
  State<LocalAuth> createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
      floatingActionButton: _authButton(),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Account Balance",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          if (isAuthenticated)
            const Text(
              "\$ 5000",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          if (!isAuthenticated)
            const Text(
              "*****",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
        ],
      ),
    );
  }

  Widget _authButton() {
    return FloatingActionButton(
      onPressed: () async {
        if (!isAuthenticated) {
          final bool canAuthWithBio =
              await LocalAuthentication().canCheckBiometrics;
          if (canAuthWithBio) {
            try {
              final bool didAuthenticate = await LocalAuthentication()
                  .authenticate(
                      localizedReason:
                          "Please Authenticate to see the account balance",
                      options:
                          const AuthenticationOptions(biometricOnly: false));

              setState(() {
                isAuthenticated = didAuthenticate;
              });
            } catch (e) {
              print(e);
            }
          }
        } else {
          setState(() {
            isAuthenticated = false;
          });
        }
      },
      child: isAuthenticated
          ? const Icon(Icons.lock)
          : const Icon(Icons.lock_open),
    );
  }
}
