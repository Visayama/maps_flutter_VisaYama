import 'package:flutter/material.dart';
import 'package:tugasandroid/coba/beranda_coba.dart';

class SplashCoba extends StatefulWidget {
  const SplashCoba({super.key});

  @override
  State<SplashCoba> createState() => _SplashCobaState();
}

class _SplashCobaState extends State<SplashCoba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Latihan'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8,),
                // const Image(
                //   image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                //   fit: BoxFit.contain,
                //   height: 150,
                //   width: 150,
                // ),
                const SizedBox(height: 10,),
                MaterialButton(
                  onPressed: (){
                    //code untuk pindah pager
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    => const BerandaCoba()
                    ));
                  },
                  child: const Text('Kamera',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                ),

                const SizedBox(height: 8,),
                MaterialButton(
                    onPressed: (){
                      //code untuk pindah page
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => const BerandaCoba()
                      ));
                    },
                    child: const Text('Maps',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),
                    ),
                    color: Colors.green,
                    textColor: Colors.white
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
