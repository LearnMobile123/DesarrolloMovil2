class User{
  var _name;
  var _email;
  var _password;
  var _ciudad;
  var _depto;
  var _temperatura;

  User(
      this._name,
      this._email,
      this._password,
      this._ciudad,
      this._depto,
      this._temperatura
      );
  User.Empty();

  User.fromJson(Map<String, dynamic> json)
  : _name         = json['name'],
    _email        = json['Email'],
    _password     = json['password'],
    _ciudad       = json['ciudad'],
    _depto        = json['depto'],
    _temperatura  = json['temperatura'];

  Map<String, dynamic> toJson() => {
    'name'        : _name,
    'Email'       : _email,
    'password'    : _password,
    'ciudad'      : _ciudad,
    'depto'       : _depto,
    'temperatura' : _temperatura
  };

  get name => _name;

  set name(value) {
    _name = value;
  }

  get email => _email;

  get temperatura => _temperatura;

  set temperatura(value) {
    _temperatura = value;
  }

  get depto => _depto;

  set depto(value) {
    _depto = value;
  }

  get ciudad => _ciudad;

  set ciudad(value) {
    _ciudad = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }
}