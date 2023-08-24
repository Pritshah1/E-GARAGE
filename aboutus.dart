import 'package:flutter/material.dart';
import 'package:egarage/route/route.dart' as route;
class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('About Us Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text('About our garage',style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 16.0),
              Text('E-garage',style: TextStyle(fontSize: 16.0),),
              SizedBox(height: 16.0),
              Text('Our Team',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 30.0,backgroundImage: NetworkImage('')

                      ),
                      SizedBox(height: 8.0),
                      Text('Harshil Mandali',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                      SizedBox(height: 8.0),
                      Text('Developer',style: TextStyle(fontSize: 14.0),),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0,backgroundImage: NetworkImage(''),
                      ),
                      SizedBox(height: 8.0),
                      Text('Prit shah',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                      SizedBox(height:8.0),
                      Text('Developer',style: TextStyle(fontSize: 14.0),),

                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0,backgroundImage: NetworkImage(''),
                      ),
                      SizedBox(height: 8.0),
                      Text('Devarsh Trivedi',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                      SizedBox(height:8.0),
                      Text('Developer',style: TextStyle(fontSize: 14.0),),

                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0,backgroundImage: NetworkImage(''),
                      ),
                      SizedBox(height: 8.0),
                      Text('Khushi shah',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                      SizedBox(height:8.0),
                      Text('Developer',style: TextStyle(fontSize: 14.0),),
                    ],
                  )

                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
 // }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About Us'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//               child: Text('go to homepage'),
//           onPressed: () => Navigator.pushNamed(context, route.aboutUs),
//         ),
//       ),
//     );
//   }
// }
