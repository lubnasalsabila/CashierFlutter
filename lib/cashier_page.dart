import 'package:flutter/material.dart';

class CashierPage extends StatefulWidget {
  const CashierPage({super.key});

  @override
  State<CashierPage> createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  List<Map<String, dynamic>> products = [
    {
      "image": "assets/image/red.jpg",
      "name": "Red Heels 7cm",
      "price": 200000,
      "stock": 15,
      "quantity": 0,
    },
    {
      "image": "assets/image/white.jpg",
      "name": "White Heels 7cm",
      "price": 250000,
      "stock": 7,
      "quantity": 0,
    },
    {
      "image": "assets/image/black.jpg",
      "name": "Black Heels 7cm",
      "price": 190000,
      "stock": 10,
      "quantity": 0,
    },
    {
      "image": "assets/image/beige.jpg",
      "name": "Beige Heels 7cm",
      "price": 195000,
      "stock": 2,
      "quantity": 0,
    },
    {
      "image": "assets/image/gold.jpg",
      "name": "Gold Heels pesta 9cm",
      "price": 150000,
      "stock": 0,
      "quantity": 0,
    },
    {
      "image": "assets/image/silver.jpg",
      "name": "Silver Heels pesta 9cm",
      "price": 150000,
      "stock": 1,
      "quantity": 0,
    },
    {
      "image": "assets/image/pink.jpg",
      "name": "Pink Big Ribbon Heels 9cm",
      "price": 170000,
      "stock": 7,
      "quantity": 0,
    },
    {
      "image": "assets/image/ysl.jpg",
      "name": "Silver Heels pesta 9cm",
      "price": 11250000,
      "stock": 4,
      "quantity": 0,
    },
    {
      "image": "assets/image/rosegold.jpg",
      "name": "Wedding Heels rosegold Exclusive",
      "price": 1250000,
      "stock": 2,
      "quantity": 0,
    },
    {
      "image": "assets/image/flower.jpg",
      "name": "Flower Clear heels 9cm",
      "price": 1250000,
      "stock": 12,
      "quantity": 0,
    },
  ];

  int _totalItem = 0;
  int _totalHarga = 0;

  // Menambahkan item pembelian
  Future<void> _TambahItemBeli(int index) async {
    setState(() {
      if (products[index]['stock'] > 0) {
        products[index]['stock']--;
        products[index]['quantity'] = (products[index]['quantity'] ?? 0) + 1;
        _totalItem++;
        _totalHarga += products[index]['price'] as int;
      }
    });
  }

  // Mengurangi item pembelian
  Future<void> _KurangItemBeli(int index) async {
    setState(() {
      if (products[index]['quantity'] > 0) {
        products[index]['stock']++;
        products[index]['quantity'] = (products[index]['quantity'] ?? 0) - 1;
        _totalItem--;
        _totalHarga -= products[index]['price'] as int;
      }
    });
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Membuat latar belakang transparan
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 221, 179),
        title: const Text(
          "Cashier App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Gambar latar belakang
          Positioned.fill(
            child: Image.asset(
              'assets/image/background.jpg', // Path gambar latar belakang
              fit: BoxFit.cover, // Menyesuaikan ukuran gambar dengan layar
            ),
          ),
          // Konten utama
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Semoga harimu menyenangkan :)",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey[700],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Cari produk...',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("${products[index]['image']}"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        bottomLeft: Radius.circular(12.0),
                                      ),
                                      color: Colors.blueAccent.withOpacity(0.7),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${products[index]['name']}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "Stock = ${products[index]['stock']}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "RP. ${products[index]['price']}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blueAccent[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: products[index]['quantity'] > 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          _KurangItemBeli(index);
                                        },
                                        child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Icon(
                                            Icons.remove_circle_outline_rounded,
                                            color: Colors.red[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Center(
                                        child: Visibility(
                                          visible: products[index]['quantity'] > 0,
                                          child: Text(
                                            "${products[index]['quantity']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (products[index]['stock'] > 0) {
                                          _TambahItemBeli(index);
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text("Stock Kosong!"),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      },
                                      child: const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          Icons.add_circle_outline_rounded,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bagian bawah untuk menampilkan total
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total ($_totalItem item): Rp. $_totalHarga",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
