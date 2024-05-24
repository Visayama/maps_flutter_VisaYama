import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tugasandroid/model_latihan/model_kampus.dart';

class DetailBeritaMaps extends StatelessWidget {
  final Datum? data;

  const DetailBeritaMaps(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Default coordinates if data is null or coordinates are not provided
    final double defaultLat = -0.9133020584270286;
    final double defaultLng = 100.46606516931423;
    final double latitude = data != null ? double.parse(data!.lat) : defaultLat;
    final double longitude = data != null ? double.parse(data!.long) : defaultLng;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Campus",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "http://192.168.43.15/latihanmaps/gambar/${data?.gambar}",
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset('assets/placeholder.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              data?.nama ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black87,
              ),
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    data?.lokasi ?? "",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    data?.profile ?? "",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Map",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                    ),
                    child: GoogleMap(
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(latitude, longitude),
                        zoom: 16,
                      ),
                      mapType: MapType.normal,
                      markers: {
                        Marker(
                          markerId: MarkerId(data?.nama ?? "default_marker"),
                          position: LatLng(latitude, longitude),
                          infoWindow: InfoWindow(
                            title: data?.nama ?? 'Unknown Location',
                            snippet: data?.lokasi ?? '',
                          ),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
