import 'dart:math';

import 'package:flutter/cupertino.dart';

class Algo extends ChangeNotifier {
  List<int> _numbers = [];
  double _sampleSize = 1000;
  bool _isPlaying = false;
  double size = 500;
  double slider = 0.5;
  String _algorithm = "Selection Sort";

  Algo() {
    randomize();
  }

  set algorithm(val) {
    _algorithm = val;
    notifyListeners();
  }

  String get algorithm => _algorithm;
  bool get isPlaying => _isPlaying;

  set isPlaying(bool play) {
    _isPlaying = play;
    notifyListeners();
  }

  set sampleSize(double value) {
    size = _sampleSize * value;
    slider = value;
    randomize();
    notifyListeners();
  }

  double get sampleSize => _sampleSize;

  List<int> get number => _numbers;

  void play() async {
    if (_algorithm == "Selection Sort") {
      await _selectionSort();
    } else if (_algorithm == "Bubble Sort") {
      await _bubbleSort();
    } else if (_algorithm == "Quick Sort") {
      await _quickSort(0, (size - 1).round());
    } else if (_algorithm == "Insertion Sort") {
      await _insertionSort();
    }
  }

  randomize() {
    _numbers.clear();
    for (var i = 0; i < size; i++) {
      _numbers.add(Random().nextInt(_sampleSize.round()) % 100);
    }
    notifyListeners();
  }

  _selectionSort() async {
    _isPlaying = true;
    for (var i = 0; i < size - 1; i++) {
      int min_pos = i;
      for (var j = i + 1; j < size; j++) {
        if (_numbers[j] < _numbers[min_pos]) {
          min_pos = j;
        }
      }
      _swap(i, min_pos);
      await Future.delayed(Duration(milliseconds: 10));
      notifyListeners();
    }
    _isPlaying = false;
    notifyListeners();
  }

  _bubbleSort() async {
    _isPlaying = true;
    for (int i = 0; i < _numbers.length; i++) {
      for (int j = 0; j < _numbers.length - i - 1; j++) {
        if (_numbers[j] > _numbers[j + 1]) {
          _swap(j, j + 1);
          await Future.delayed(Duration(milliseconds: 5));
          notifyListeners();
        }
      }
    }
    _isPlaying = false;
    notifyListeners();
  }

  _insertionSort() async {
    print("Insertion");
    _isPlaying = true;
    for (var i = 1; i < _numbers.length; i++) {
      var current = _numbers[i];
      var j = i - 1;
      while (j >= 0 && _numbers[j] > current) {
        _numbers[j + 1] = _numbers[j];
        j--;
      }
      _numbers[j + 1] = current;
      await Future.delayed(Duration(milliseconds: 5));
      notifyListeners();
    }
    _isPlaying = false;
    notifyListeners();
  }

  _quickSort(int low, int high) async {
    _isPlaying = true;
    if (low < high) {
      int pi = await _partition(low, high);
      await _quickSort(low, pi - 1);
      await _quickSort(pi + 1, high);
    }
    isPlaying = false;
    notifyListeners();
  }

  _partition(int low, int high) async {
    int pivot = _numbers[high];
    int i = (low - 1);

    for (int j = low; j <= high - 1; j++) {
      if (_numbers[j] < pivot) {
        i++;
        await _swap(i, j);
      }
    }
    await _swap(i + 1, high);
    return (i + 1);
  }

// swapping two numbers
  _swap(int i, int j) async {
    int temp = _numbers[i];
    _numbers[i] = _numbers[j];
    _numbers[j] = temp;
    await Future.delayed(Duration(milliseconds: 5));
    notifyListeners();
  }
}
