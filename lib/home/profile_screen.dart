import 'package:flutter/material.dart';

// Vehicle details screen
class VehicleDetailsScreen extends StatelessWidget {
  final String vehicleName;
  final String vehicleLicense;
  final String vehicleImageUrl;

  const VehicleDetailsScreen({
    required this.vehicleName,
    required this.vehicleLicense,
    required this.vehicleImageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vehicle Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              vehicleImageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'Name: $vehicleName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'License Plate: $vehicleLicense',
              style: const TextStyle(fontSize: 16),
            ),
            // Add any other vehicle details you want here
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Sample vehicle data
  final String vehicleName = 'Honda Civic';
  final String vehicleLicense = 'AB 1234 CD';
  final String vehicleImageUrl =
      'assets/images/plane.png'; // Replace with your own image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Section
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              const SizedBox(height: 16),
              const Text(
                'John Doe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Email: johndoe@gmail.com'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement edit profile action
                },
                child: const Text('Edit Profile'),
              ),

              // Vehicle Info Card Section
              const SizedBox(height: 32), // Add some spacing
              GestureDetector(
                onTap: () {
                  // Navigate to vehicle details page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleDetailsScreen(
                        vehicleName: vehicleName,
                        vehicleLicense: vehicleLicense,
                        vehicleImageUrl: vehicleImageUrl,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Vehicle Info',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Image.network(
                          vehicleImageUrl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Name: $vehicleName',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'License Plate: $vehicleLicense',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
