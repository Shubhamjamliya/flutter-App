import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:math';

class MyHomePage extends StatelessWidget {
  final String avatarUrl =
      "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170), // AppBar + TabBar height
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 2,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar Row
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          child: GFAvatar(
                            backgroundImage: NetworkImage(avatarUrl),
                            shape: GFAvatarShape.circle,
                            size: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome Back, Shubham",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Your financial situation looks good!",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),

                              SizedBox(height: 6),

                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  height: 6,
                                  width: double.infinity,
                                  child: GFProgressBar(
                                    percentage: 0.5,
                                    backgroundColor: Colors.black26,
                                    progressBarColor: GFColors.PRIMARY,
                                    lineHeight: 6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Tab Bar
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.blue,
                      indicatorWeight: 3,
                      tabs: [
                        Tab(text: "Today"),
                        Tab(text: "Monthly"),
                        Tab(text: "Yearly"),
                        Tab(text: "Future"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),



        // Tab Views
      body: TabBarView(
      children: [
          // TODAY SECTION
          ListView.builder(
          padding: EdgeInsets.all(12),
      itemCount: 5,
      itemBuilder: (context, index) {
        // Random pastel color
        final colors = [
          Colors.blueGrey.shade300,
          Colors.black12,
          Colors.green,
          Colors.deepPurple,
          Colors.teal,
        ];
        final bgColor = colors[index % colors.length];

        // Heart animation state
        ValueNotifier<bool> liked = ValueNotifier(false);

        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First row: Toggle + heading + date
              Row(
                children: [
                  Switch(
                    value: index % 2 == 0,
                    onChanged: (val) {},
                    activeColor: Colors.deepOrangeAccent,
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Goal ${index + 1}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "12 Aug 2025",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10),

              // Content
              Text(
                "This is a short description of your goal. Keep it up to date to stay on track.",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),

              SizedBox(height: 12),

              // Last row: Setup button + heart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Setup a Goal",style: TextStyle(fontSize: 17,color:Colors.black,fontWeight: FontWeight.w800),
                    ),
                  ),

                  // Heart emoji with animation
                  ValueListenableBuilder<bool>(
                    valueListenable: liked,
                    builder: (context, isLiked, child) {
                      return GestureDetector(
                        onTap: () {
                          liked.value = !liked.value;
                        },
                        child: AnimatedScale(
                          scale: isLiked ? 1.3 : 1.0,
                          duration: Duration(milliseconds: 200),
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: Colors.white, // White heart
                            size: 26,
                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ],
          ),
        );
      },
    ),

    // Monthly Tab
    Center(child: Text("Monthly Data")),

    // Yearly Tab
    Center(child: Text("Yearly Data")),

    // Future Tab
    Center(child: Text("Future Data")),
    ],
    ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}
