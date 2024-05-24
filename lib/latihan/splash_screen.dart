import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugasandroid/latihan/maps_page.dart';
import 'package:tugasandroid/model_latihan/model_kampus.dart';

class PageBeranda extends StatefulWidget {
  const PageBeranda({super.key});

  @override
  State<PageBeranda> createState() => _PageBerandaState();
}

class _PageBerandaState extends State<PageBeranda> {
  TextEditingController searchController = TextEditingController();
  List<Datum>? kampusList;
  List<Datum>? filteredKampusList;

  // Method untuk get kampus
  Future<void> getKampus() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://192.168.100.100/latihanmaps/getKampus.php'));
      if (response.statusCode == 200) {
        setState(() {
          kampusList = modelKampusFromJson(response.body).data;
          filteredKampusList = kampusList;
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to load data')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void initState() {
    super.initState();
    getKampus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    filteredKampusList = kampusList
                        ?.where((element) =>
                    element.nama.toLowerCase().contains(value.toLowerCase()) ||
                        element.lokasi.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Most Visited',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'gambar/gambar1.png',
                  fit: BoxFit.contain,
                  height: 262,
                  width: 209,
                ),
                SizedBox(width: 10),
                Image.asset(
                  'gambar/gambar1.png',
                  fit: BoxFit.contain,
                  height: 262,
                  width: 209,
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Near You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Padang Kota Tercinta',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 10),
            kampusList == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredKampusList!.length,
              itemBuilder: (context, index) {
                Datum data = filteredKampusList![index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailBeritaMaps(data),
                        ),
                      );
                    },
                    child: Card(
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 106,
                          maxWidth: 400,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'http://192.168.100.100/latihanmaps/gambar/${data.gambar}',
                                  fit: BoxFit.cover,
                                  height: 76,
                                  width: 76,
                                  errorBuilder: (context, error, stackTrace) => Image.asset('assets/placeholder.png', fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.nama,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '1.5 km',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      data.lokasi,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
