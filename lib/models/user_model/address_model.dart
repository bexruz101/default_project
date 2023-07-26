import 'geolocation_model.dart';

class AddressModel {
  GeolocationModel geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  AddressModel(
      {required this.city,
      required this.geolocation,
      required this.number,
      required this.street,
      required this.zipcode});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        city: json['city'],
        geolocation: json['geolocation'],
        number: json['number'],
        street: json['street'],
        zipcode: json['zipcode']);
  }

  Map<String, dynamic> toJson() => {
        "city": city,
        "geolocation": geolocation,
        "number": number,
        "street": street,
        "zipcode": zipcode,
      };
}
