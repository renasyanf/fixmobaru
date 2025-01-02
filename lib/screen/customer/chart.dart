import 'package:flutter/material.dart';

class Keranjang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Saya"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          // Section: Tebus Murah
          Container(
            color: Colors.yellow[100],
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Simpan layanan service dan sparepartmu dulu yuk!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 77, 43, 14),
                  ),
                  child: Text("Check"),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey),

          // Section: Spare Parts List
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Spare Parts",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        

          // Section: Services List
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Services",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          

          // Section: Total and Checkout Button
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rp 0",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Rp 0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String title;
  final int price;
  final int? oldPrice;
  final int quantity;
  final String imageUrl;

  ProductTile({
    required this.title,
    required this.price,
    this.oldPrice,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (value) {}),
          Image.network(imageUrl, width: 50, height: 50),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                oldPrice != null
                    ? Text(
                        "Rp ${oldPrice.toString()}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      )
                    : SizedBox.shrink(),
                Text(
                  "Rp ${price.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {},
              ),
              Text(quantity.toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final int price;
  final int quantity;

  ServiceTile({
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (value) {}),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Rp ${price.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {},
              ),
              Text(quantity.toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
