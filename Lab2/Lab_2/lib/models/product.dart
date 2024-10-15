import 'package:lab_2/extensions/extensions.dart';

class Product {
  final int _id;
  String _name;
  String _description;
  double _price;
  String _imgUrl;

  Product({
    required int id,
    required String name,
    required String description,
    required double price,
    required String imgUrl,
  })  : _id = id,
        _name = name,
        _description = description,
        _price = price,
        _imgUrl = imgUrl;

  int get id => _id;

  void _setName(String value) {
    if (!_validateStringValues(value)) throw ArgumentError('Incorrect value passed for name');
    _name = value;
  }

  void _setDescription(String value) {
    if (!_validateStringValues(value)) throw ArgumentError('Incorrect value passed for description');
    _description = value;
  }

  void _setPrice(double value) {
    if (value.isNaN || value <= 0) throw ArgumentError('Incorrect value passed for price');
    _price = value;
  }

  void _setImgUrl(String value) {
    if (!_validateStringValues(value)) throw ArgumentError('Incorrect value passed for image URL');
    _imgUrl = value;
  }

  bool _validateStringValues(String value) {
    return value.isNotEmpty && value.length >= 2 && value.length <= 25;
  }

  String get name => _name;
  String get description => _description;
  double get price => _price;
  String get imgUrl => _imgUrl;

  void validateFields() {
    if (!_validateStringValues(_name)) {
      throw ArgumentError('Invalid name: must be between 2 and 25 characters and non-empty');
    }
    if (!_validateStringValues(_description)) {
      throw ArgumentError('Invalid description: must be between 2 and 25 characters and non-empty');
    }
    if (_price <= 0 || _price.isNaN) {
      throw ArgumentError('Invalid price: must be greater than 0');
    }
    if (!_validateStringValues(_imgUrl)) {
      throw ArgumentError('Invalid image URL: must be between 2 and 25 characters and non-empty');
    }
  }

  void update({Product? newProduct, String? fieldName, dynamic value}) {
    if (newProduct.isNotNull) {
      newProduct?.validateFields();

      _name = newProduct!._name;
      _description = newProduct._description;
      _price = newProduct._price;
      _imgUrl = newProduct._imgUrl;
    } else if (fieldName.isNotNull && value.isNotNull) {
      switch (fieldName) {
        case 'name':
          _setName(value as String);
          break;
        case 'description':
          _setDescription(value as String);
          break;
        case 'price':
          _setPrice(value as double);
          break;
        case 'imgUrl':
          _setImgUrl(value as String);
          break;
        default:
          throw ArgumentError('Unknown field name: $fieldName');
      }
    } else {
      throw ArgumentError('Either newProduct or field name and value must be provided');
    }
  }
}
