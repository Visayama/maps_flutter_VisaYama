import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'model_rs/model_kamar.dart';

class PageKamar extends StatefulWidget {
  final String idRs;
  final String namaKamar;

  const PageKamar({Key? key, required this.idRs, required this.namaKamar}) : super(key: key);

  @override
  State<PageKamar> createState() => _PageKamarState();
}

class _PageKamarState extends State<PageKamar> {
  ModelKamar? modelKamar;
  TextEditingController searchController = TextEditingController();
  List<Datum>? kamarList;
  List<Datum>? filteredKamarList;
  double? lat;
  double? loong;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('http://192.168.100.100/listrumahsakit/kamar.php'));
      if (response.statusCode == 200) {
        ModelKamar modelKamar = modelKamarFromJson(response.body);
        setState(() {
          kamarList = modelKamar.data.where((datum) => datum.idRs == widget.idRs).toList();
          filteredKamarList = kamarList;
          if (kamarList!.isNotEmpty) {
            lat = double.parse(kamarList![0].lat);
            loong = double.parse(kamarList![0].loong);
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load data')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void searchKamar(String keyword) {
    setState(() {
      filteredKamarList = kamarList
          ?.where((datum) => datum.namaKamar.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('List Kamar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  filteredKamarList = kamarList
                      ?.where((element) =>
                  element.namaKamar.toLowerCase().contains(value.toLowerCase()) ||
                      element.idKamar.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.orange,
                labelText: "Search",
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Colors.orange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.blueGrey,
                    child: lat != null && loong != null
                        ? Container(
                      height: 300,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(lat!, loong!),
                          zoom: 14,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId(widget.idRs),
                            position: LatLng(lat!, loong!),
                            infoWindow: InfoWindow(title: widget.namaKamar),
                          ),
                        },
                      ),
                    )
                        : Center(
                      child: Text('No data available'),
                    ),
                  ),
                  SizedBox(height: 20),
                  filteredKamarList == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredKamarList!.length,
                    itemBuilder: (context, index) {
                      Datum data = filteredKamarList![index];
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.namaKamar,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Jumlah Kamar: ${data.jumlahAntrian}'),
                              SizedBox(height: 4),
                              Text('Kamar Tersedia: ${data.kamarTer}'),
                            ],
                          ),
                        ),
                      );
                    },
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
