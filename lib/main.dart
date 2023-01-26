import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  //CONST ve FINAL sabit değerlerdir, sonradan değiştirilemez
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

  print(KonuVeEylem("konu", "eylem"));

  print(KonuVeEylem2("ders anlatimi"));
  print(KonuVeEylem2(
      "ders anlatimi", "eylem parametresi benim yolladigim parametreyi aldi"));

  print(KonuVeEylem3());
  print(KonuVeEylem3(
      eylem: "eylem degerini ilk sirada verdim",
      konu: "konu degerini ikinci sirada verdim"));

  print(Selam("se", "lam"));

  //SET -> küme parantezi ile gösterilir ve aynı değerleri içermez
  final arkadaslar = {"ali", 2, true, "ali"};
  print(arkadaslar);
  //tip belirli SET
  final Set<String> arkadass = {"a", "b", "c"};
  print(arkadass);

  //LIST -> köşeli parantez ile gösterilir ve aynı değerleri içerebilir
  final mesajlar = ["selam", 1, false, "selam", 1, false];
  print(mesajlar);
  //tip belirli LIST
  final List<int> mesajs = [1, 2, 3];
  print(mesajs);

  //MAP (key: value) şeklinde tanımlanır
  final etiketler = {"sosyal": 1, "iş": 2, "aile": 3};
  print(etiketler);
  print(etiketler["sosyal"]);
  //tip belirli MAP
  final Map<String, bool> etikets = {"dogru": true, "yanlis": false};
  print(etikets);

  //sınıf içindeki static değişkenlere  direkt sınıf adı. diyerek ulaşabiliriz
  final ol = Ogrenci.okulAdi;

  //Generic class yaratma
  GenericClassim<int> gci = GenericClassim<int>(3);
  print(gci.value);
  GenericClassim<String> gcs = GenericClassim<String>("selam");
  print(gcs.value);

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

//konu ve eylem parametrelerinin her ikisi de zorunludur
String KonuVeEylem(String konu, String eylem) {
  return konu + ": " + eylem;
}

//köşeli parantez ile yaratılan parametreler zorunlu değildir ve zorunlu olmadığı için default değer oluşturmanı ister
//konu parametresi zorunludur
//eylem parametresi zorunlu değildir
String KonuVeEylem2(String konu,
    [String eylem = "eylem parametresi default degerini aldi"]) {
  return konu + ": " + eylem;
}

//küme parantezi ile yaratılan parametreler zorunlu değildir ve zorunlu olmadığı için default değer oluşturmanı ister
//küme parantezi ile yaratılan parametreler isimlidir ve çağrıldığında sırayla değil isimle çağrılırlar
//konu parametresi de eylem parametresi de zorunlu değildir
String KonuVeEylem3({String konu = "", String eylem = ""}) {
  return konu + ": " + eylem;
}

//return yapmak için expression formatı da kullanılabilir
String? Selam(String a, String b) => a + b;

//CLASS içindeki STATIC değerler, GLOBAL değişken olur
class Ogrenci {
  //static değişken:
  static String okulAdi = "Atatürk İlkokulu";
  //static method:
  static void okulAdiDegistir(String okuladi) {
    okulAdi = okuladi;
  }
}

//Generic class'tan bir tane yaratıp, farkı türler için istediğimiz kadar kullanabiliyoruz
class GenericClassim<T> {
  T value;
  GenericClassim(this.value);
}

//Aşağıdaki generic class, sadece num yani int ve double türünde oluşsun istedik
class GenericClassim2<T extends num> {}
