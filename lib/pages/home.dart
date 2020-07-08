import 'package:flutter/material.dart';
import 'package:flutter_shoes_shop/models/shoe_model.dart';
// import 'package:flutter_shoes_shop/pages/detals.dart';
import 'package:flutter_shoes_shop/widgets/app_clipper.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  // trazer a lista de produto da classe "shoe_model"
  List<ShoeModel> shoeList = ShoeModel.list;
  
  @override
  Widget build(BuildContext context) {
    
    // var AppColors;

    return Scaffold(

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),

      body: ListView(
        children: <Widget>[
          
          // Categorias de produtos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Categorias", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black26),
                  onPressed: null,
                ),
              ],
            ),
          ),
          
          // Slide Horizontal
          Container(
            height: 300,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: shoeList.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => Details(
                    //       shoeList[index]
                    //     )
                    //   )
                    // );
                  },
                    child: Container(
                    width: 230,
                    margin: EdgeInsets.only(right:16),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: _buildBackground(index, 230),
                        ),
                        Positioned(
                          bottom: 130,
                          right: 10,
                            child: Transform.rotate(
                            angle: -math.pi / 7,
                            child: Image(
                              width: 220,
                              image: AssetImage("images/${shoeList[index].imgPath}")
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 16),
                    
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("SOMENTE PARA VOCÊ",
                  style: TextStyle(
                    color: Colors.black54
                  ),
                ),
                Text("VER TODOS",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height:24),

          // Lista de produtos
          ...shoeList.map((data) => GestureDetector(
            onTap: (){
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => Details(
              //       data,
              //     )
              //   )
              // );
            },
            child: Container(
              margin: EdgeInsets.only(left:16, right:16, bottom:10),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ]
              ),
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/${data.imgPath}'),
                    width: 100,
                    height: 60,
                  ),
                  
                  SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Text('${data.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Text('${data.brand}',
                          style: TextStyle(
                            color: Colors.black26,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('\$${data.price.toInt()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))

        ],
      ),

      // Barra de navegação inferior
      bottomNavigationBar: Container(
        // margin: EdgeInsets.fromLTRB(16, 0, 16, 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)), 
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 8),
            )
          ]
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.black26,
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('data'),
            ),
          ]
        ),
      ),

    );
  }

  Widget _buildBackground(int index, double width) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        color: shoeList[index].color,
        width: width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:16),
                    child: Icon(
                      shoeList[index].brand == "Nike"
                        ? Icons.star_border
                        : Icons.star_half,
                        size: 30,
                        color: Colors.white
                      ),
                  ),
                  
                  Expanded(child: SizedBox()),
                  
                  Container(
                    width: 125,
                    child: Text("${shoeList[index].name}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 8),
                  
                  Text("${shoeList[index].price}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                  SizedBox(height: 16),
                  
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}