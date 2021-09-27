import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:githubuser_api/service/http_page.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> resBody = Map();

  @override
  void initState() {
    super.initState();

    _apiPostGet();
  }

  void _apiPostGet() {
    Network.GET(Network.API_GET, 'Ibrohimjonn').then((response) {
      setState(() {
        resBody = jsonDecode(response.toString());
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // User photo
                  CircleAvatar(
                    backgroundColor: const Color(0xFF171b21),
                    radius: 40,
                    backgroundImage: NetworkImage(resBody["avatar_url"]),
                  ),
                  const SizedBox(width: 30,),
                  // Login || Username
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username
                      Text(resBody["name"], style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      // Login
                      Text(resBody["login"], style: const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 20,color: Colors.black,),
            // Repositories
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20,),
                const Text('Repositories', style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),),
                SizedBox(width: 10,),
                Container(
                  width: 35,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text('${resBody["public_repos"]}', style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            // bio
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 50,),
                const Text('Bio',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                const SizedBox(width: 10,),
                Container(
                  height: 25,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(resBody["bio"], style: const TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Followers',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                const SizedBox(width: 10,),
                Container(
                  width: 35,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text('${resBody["followers"]}',style: const TextStyle(color: Colors.black),),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Following',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                const SizedBox(width: 10,),
                Container(
                  width: 35,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text('${resBody["following"]}',style: const TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
