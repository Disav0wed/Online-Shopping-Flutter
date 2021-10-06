import 'package:flutter/material.dart';
import 'package:online_shopping_flutter/Providers/product_detail_provider.dart';
import 'package:online_shopping_flutter/model/product_detail.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'productDetailScreen';

  @override
  Widget build(BuildContext context) {
    ProductDetail _productDetail;
    _productDetail = Provider.of<ProductDetailProvider>(context).item;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 40,
                  color: Colors.white70,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxHeight: (MediaQuery.of(context).size.height / 3) * 2),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 800, maxHeight: 800),
                        child: Image.network(
                          _productDetail.imageUrl,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _productDetail.name,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Fiyat: ${_productDetail.price} TL',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            'Detay: ${_productDetail.description} asasldasldjasldjsaldjlasdjl sdksdlsjdlsjldsjldsj sldkjsldj sadjsasjdlasjdlasjdsaldjasldkjslajdlj',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                child: MaterialButton(
                    elevation: 25,
                    padding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Sepete Ekle',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.longestSide / 30,
                      ),
                    ),
                    onPressed: () {
                      print('Satin Al');
                      Navigator.pop(context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
