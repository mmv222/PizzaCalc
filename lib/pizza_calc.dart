import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PizzaCalculator extends StatefulWidget {
  const PizzaCalculator({Key? key}) : super(key: key);

  @override
  _PizzaCalculatorState createState() => _PizzaCalculatorState();
}

enum Sauce {hot, tart, cheese}

class _PizzaCalculatorState extends State<PizzaCalculator> {
  bool _slimDough=false;
  int _size=40;
  int _startcost=200;
  int _cost=0;
  Sauce? _sauce=Sauce.hot;
  bool _addCheese=true;

  int _calc()
  {
    _cost = _startcost + _size;
    if (_slimDough==true){_cost +=50;}
    if (_addCheese==true){_cost +=40;}


    switch (_sauce)
    {
      case Sauce.hot:
        _cost +=20;
        break;
      case Sauce.tart:
        _cost +=40;
        break;
      case Sauce.cheese:
        _cost +=50;
        break;


    }
    if (_size==0){_cost=0;}
    return _cost;
  }

  void _sauseChange(Sauce? value){
      setState(() {
        _sauce=value;
      });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 162,
                child: Image.asset('assets/pizza.png'),
              ),
              Text("Калькулятор пиццы", style: TextStyle(fontSize: 36, color: Color(0xFF000000))),
              Text("Выберите параметры", style: TextStyle(fontSize: 16, color:  Color(0xFF000000))),
              SizedBox( height: 16,),



              //выбор теста
              SizedBox(
                width: 340,
                child: SlidingSwitch(
                  value: false,
                  width: 340,
                  onChanged: (bool value) {
                    _slimDough=value;
                    setState(() {
                      _calc();
                    });
                  },
                  height: 30,
                  animationDuration: Duration(microseconds: 150),
                    onTap:(){},
                    onDoubleTap:(){},
                    onSwipe:(){},
                    textOff : "Обычное тесто",
                    textOn : "Тонкое тесто",
                    colorOn : const Color(0xffFFFFFF),
                    colorOff : const Color(0xf0FFFFFF),
                    background : const Color(0xffe4e5eb),
                    buttonColor : const Color(0xff0079D0),
                    inactiveColor : const Color(0xff636f7b)
                ),
              ),
              SizedBox(height: 29,),

              //выбор диаметра
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 27),
                child: Text("Размер ${_size} см",
                  style: TextStyle(fontSize: 20, color: Color(0xFF263238)),),
              ),


              Slider(
                value: _size.toDouble(),
                max: 60,
                divisions: 6,
                label: _size.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _size = value.toInt();
                  });
                },
              ),


              //радиокнопки выбора соуса
              Container(alignment: Alignment.centerLeft,
                  padding:  const EdgeInsets.only(left: 27),
                  child: const Text("Соус:", style: TextStyle(fontSize: 16, color: Color(0xFF263238)),)),
              RadioListTile <Sauce>(
                title:  Text("острый"),
                value: Sauce.hot,
                groupValue: _sauce,
                onChanged: _sauseChange,
              ),
              RadioListTile <Sauce>(
                title:  Text("кисло-сладкий"),
                value: Sauce.tart,
                groupValue: _sauce,
                onChanged: _sauseChange,
              ),
              RadioListTile <Sauce>(
                title:  Text("сырный"),
                value: Sauce.cheese,
                groupValue: _sauce,
                onChanged: _sauseChange,
              ),


              //доп. сыр
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only( right: 20,),
                    child: SizedBox(width: 38,
                        height: 56,
                    child: Image.asset('assets/chees.png'),),
                  ),
                  const Text("Дополнительный сыр",style: TextStyle(fontSize: 16,
                      color: Color(0xFF263238)),
                  ),


                  Switch(value: _addCheese, onChanged: (val) {setState(() {
                    _addCheese =!_addCheese;
                  });}),
                ],
              ),

              SizedBox(height: 40,),

              //итоговая стоимость
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 27),
                child: const Text("Стоимость:",
                style: TextStyle(fontSize: 20, color: Color(0xFF263238)),),
              ),

              SizedBox(
                width: 300,
                height: 50,
                child:  Card(
                  elevation: 0,
                  color: Color(0xFFF0F0F0),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                  child:  Text("${_calc()}руб.",
                  style:  TextStyle(fontSize: 32, color:  Color(0xFF000000),),
                    textAlign: TextAlign.center,
                ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
