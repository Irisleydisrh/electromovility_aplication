import 'package:flutter/material.dart';
import 'package:phase_mobil/components/my_button.dart';
import 'subpages/chargerslist_subpage.dart';
import 'subpages/edit_profile_subpage.dart'; // Importa la página para editar el perfil
import 'subpages/manage_vehicles_subpage.dart'; // Importa la página para gestionar vehículos

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              buttonColor: const Color.fromRGBO(53, 184, 134, 1),
              buttonText: 'Edit Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20), // Espacio entre botones
            MyButton(
              buttonColor: const Color.fromRGBO(53, 184, 134, 1),
              buttonText: 'Manage Vehicles',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageVehiclesPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20), // Espacio entre botones
            MyButton(
              buttonColor: const Color.fromRGBO(53, 184, 134, 1),
              buttonText: 'My Chargers',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChargerListPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
