import 'dart:convert';
MocSearch mocSearchFromJson(String str) => MocSearch.fromJson(json.decode(str));
String mocSearchToJson(MocSearch data) => json.encode(data.toJson());
class MocSearch {
  MocSearch({
      this.id, 
      this.counter, 
      this.city, 
      this.street,});

  MocSearch.fromJson(dynamic json) {
    id = json['id'];
    counter = json['counter'];
    city = json['city'];
    street = json['street'];
  }
  String? id;
  String? counter;
  String? city;
  String? street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['counter'] = counter;
    map['city'] = city;
    map['street'] = street;
    return map;
  }

}

List<Map<String, dynamic>> categoriesMock = [
  {
    "id": '01',
    "counter": 'O\'zbekistan',
    "city": 'Tashkent',
    "street": 'Aviyasozlar 5-tor ko\'chasi ',
  },
  {
    "id": '02',
    "counter": 'O\'zbekistan',
    "city": 'Tashkent',
    "street": 'Aviyasozlar 4-tor ko\'chasi ',
  },
  {
    "id": '03',
    "counter": 'O\'zbekistan',
    "city": 'Tashkent',
    "street": 'Aviyasozlar 3-tor ko\'chasi ',
  },
  {
    "id": '04',
    "counter": 'O\'zbekistan',
    "city": 'Tashkent',
    "street": 'Aviyasozlar 2-tor ko\'chasi ',
  },
  {
    "id": '05',
    "counter": 'O\'zbekistan',
    "city": 'Tashkent',
    "street": 'Aviyasozlar 1-tor ko\'chasi ',
  },
  {
    "id": '06',
    "counter": 'O\'zbekistan',
    "city": 'Tashkent',
    "street": 'Aviyasozlar ko\'chasi ',
  },
  {
    "id": '07',
    "counter": 'O\'zbekistan',
    "city": 'Tashkent',
    "street": 'Olmazor ko\'chasi ',
  },
];