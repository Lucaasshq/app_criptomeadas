import 'dart:collection';

import 'package:flutter/material.dart';
import '../models/moedas.dart';

class FavoritasRepository extends ChangeNotifier {
  final List<Moeda> _lista = [];

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  salveAll(List<Moeda> moedas) {
    for (var moeda in moedas) {
      if (!_lista.contains(moeda)){
        _lista.add(moeda);
      } 
    }
    notifyListeners();
  }

  remove(Moeda moeda) {
    _lista.remove(moeda);
   
    notifyListeners();
  }
}
