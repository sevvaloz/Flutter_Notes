import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  //CONST
  const value =
      "bu bir const value"; //kod compile edilirken sabit bir değer atanır
  print(value);

  //FINAL
  final value2 =
      "bu bir final value"; //kod run edilirken sabit bir değer atanır
  print(value2);

  //VAR
  var value3 = "bu bir var value";
  print(value3);
  value3 = "bu yeni bir var value";
  print(value3);

  //STRING TOPLAMA
  var number = "1";
  var number2 = "3";
  print(number + number2);

  //DENK IFADELER
  double n = 1.0;
  var n2 = 1.0 as double;
  var n3 = 1.0;

  //DOLAR ISARETI
  String s = "price: 10\$";
  print(s);

  //BOOL
  var a = 1.0;
  bool isBiggerThanZero = a > 0;
  print(isBiggerThanZero);

  //NULLABLE -> null olabilir de olmayabilir de
  String? userName;
  print("user name: $userName");

  //LATE -> değerini bilmiyoruz(null da olabilir) ama sonradan kesinlikle değer ataması yapılacak
  late int password;
  password = 123;
  print(password);

  //CONDITION
  int numb = 5;
  numb -= 2; //numb = 3 oldu
  int calc = numb == 5
      ? numb++
      : numb; //numb 5 ise 1 artır, değilse kendi değerinde kalsın
  print(calc);

  //CONDITION
  int b = 9;
  int? numb2; // int? demek int de olabilir null da olabilir demek
  int calc2 = numb2 ?? b; //numb2 null ise b'yi yazdır
  print(calc2);

  //TRY-CATCH -> try bloğu içindeki kodlar hata alınmazsa çalışır, hata alınırsa catch bloğu çalışır. Finally bloğu, ne olursa olsun her durumda çalışır
  var h;
  try {
    if (h > 7) {
      print(h);
    }
  } on Exception {
    throw "error";
  } on NoSuchMethodError catch (e) {
    print(e);
  } on NullThrownError catch (e) {
    print(e);
  } catch (e) {
    print(e);
  } finally {
    print("mission abort");
  }

  //
  double dob = 1.87654321;
  print("dob: " + dob.toStringAsFixed(2)); //virgülden sonra 2 basamak göster

  //FONKSIYON ÇAĞIRMA
  var isim = "Hello";
  printFonksiyonu(isim);

  var sonuc = returnFonksiyonu();
  print(sonuc);

  //LISTE
  var list = [1, 2, "s", "b", 6];
  if (!list.contains(7)) {
    list.add(7);
    print(list);
  }

  var isThere = list.contains("b");
  print(isThere);

  var list2 = list
      .where((element) => element == 1 || element == "s")
      .toList(); //list'in içindeki elemanlardan 1'e veya s'ye eşit olanları al ve list2'ye eleman olarak ekle
  print(list2);

  //SET => memory'de stack şeklinde aynı yerde tutulan liste
  var set = <int>{8, 9, 10};

  //MAP (key, value)
  Map<String, int> map = {"a": 0, "p": 1, "m": 2};
  Map<String, dynamic> map2 = {
    "a": true,
    "p": 1.8,
    "m": "k",
    "h": [1, 2, 3],
    "y": {"st", "in", "bo"}
  }; //dynamic value, her tipi alabilir. value burada sırayla: boolean, double, string, liste, obje tipinde değer almıştır

  //CONSTRUCTOR ÇAĞIRMA
  Student student1 = Student(
      name: "Şevval"); //student adlı constructor sadece adı zorunlu tutuyor
  Student student2 = Student.secondary(
      name: "Ezgi",
      age:
          28); //student.secondary adlı constructor hem adı hem yaşı zorunlu tutuyor

  //GETTER VE SETTER KULLANMA
  print(student1.getName + " " + student1.getAge);
  print(student2.name + " " + student2.age.toString());

  student2.setName = "Ezgiyi";
  student2.setAge = 29;
  print(student2.name + " " + student2.age.toString());

  //school'u extend eder
  print(student1.classes.first.toString());

 

 
//main fonksiyon bitişi
}

//void fonksiyon
printFonksiyonu(String it) {
  print(it);
}

//string tipli fonksiyon
String returnFonksiyonu() {
  return "Merhaba";
}

//CLASS, CONSTRUCTOR
class Student extends School {
  String name;
  int age;

  //getter
  String get getName => name;
  String get getAge => age.toString();

  //setter
  void set setName(String name) {
    this.name = name;
  }

  void set setAge(int age) {
    this.age = age;
  }

  //ilk constructor
  Student({required this.name, this.age = 0});
  //ikinci constructor
  Student.secondary({required this.name, required this.age});
}

//KALITIM, POLIMORFIZM
class School {
  List<String> classes = ["Math", "Physic", "Chemistiry"];
}


