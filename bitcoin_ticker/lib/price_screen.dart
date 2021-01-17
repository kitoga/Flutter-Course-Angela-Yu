import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './coin_data.dart';

const apiKey = 'OTg2MTkxNzhjMjU0NDEwM2EyYTdkOTRiNDkyMDA2NDg';
const api = ''

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  
  String startValue = 'USD';

  @override
  void initState() { 
    super.initState();
    
    //updateUI();
    
  }

  Future getCoinData() async{
    Response response = await get('https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD');

    print(response.body);
  }

  // void updateUI() async{
  //   try{
  //     double data = await CoinData().getCoinData();

  //     setState(() {
  //       getBtcData = data.toStringAsFixed(0);
  //     });
  //   }catch (e){
  //     print(e);
  //   }
  // }

  // String getBtcData = '?';



  


  //todo create a for loop to loop the list in the widget  For Loop/For IN loop
  List<DropdownMenuItem> getDropDown(){
    List<DropdownMenuItem<String>> dropDownItems = [];
    // for(int i = 0 ; i < currenciesList.length; i++)
    for(String currency in currenciesList){
    //String currency = currenciesList[i];

      var newItems = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItems);
    }
    return dropDownItems;
  }
  @override
  Widget build(BuildContext context) {
    getCoinData();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            //todo number 1 /////drop down menu
            child: DropdownButton(
              value: startValue,
              //passin the getDropDown
              items: getDropDown(),
              onChanged: (value){
                setState(() {
                  startValue = value;
                });
              },
              
            ),
          ),
        ],
      ),
    );
  }
}
