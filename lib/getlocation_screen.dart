import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GetlocationScreen extends StatefulWidget {
  const GetlocationScreen({super.key});

  @override
  State<GetlocationScreen> createState() => _GetlocationScreenState();
}

class _GetlocationScreenState extends State<GetlocationScreen> {
  String? latitude;
  String? longitude;
  String? address;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    setState(() {
      isLoading = true;
    });

    try {
      // check permission maps
      LocationPermission permission = await Geolocator.checkPermission();
      // jika denied maka request permission
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            isLoading = false;
            address = 'Permission denied';
          });
          return;
        }
      }

      // jika denied forever maka buka setting
      if (permission == LocationPermission.deniedForever) {
        setState(() {
          isLoading = false;
          address = 'Permission denied forever please enable from setting';
        });
      }
      // mendapatkan lokasi latitude dan longitude
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );

      // convert latitude dan longitude ke alamat
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      // print(placemarks[0].country);
      Placemark placemark = placemarks[0];
      setState(() {
        isLoading = false;
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
        address =
            "${placemark.name}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
      });

    } catch (e) {
      setState(() {
        isLoading = false;
        address = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocator and Geocode'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Latitude: $latitude, Longitude: $longitude",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(address ?? 'No data'),
                ],
              ),
      ),
    );
  }
}
