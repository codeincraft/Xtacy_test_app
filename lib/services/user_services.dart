import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService {
  var storage = const FlutterSecureStorage();

  // setToken(accessToken) async {
  //   await storage.write(key: 'token', value: accessToken['token']);
  //   await storage.write(key: 'token_expires_at', value: accessToken['expiryDate']);
  // }
    setToken(accessToken) async {
    await storage.write(key: 'token', value: accessToken);
    // await storage.write(key: 'token_expires_at', value: accessToken['expiryDate']);
  }

  setRole(role) async {
    await storage.write(key: 'role', value: role);
  }

  // setLocation(LatLng latlng, address) async {
  //   await storage.write(key: 'location', value: '{"address": "$address", "latitude": "${latlng.latitude}", "longitude": "${latlng.longitude}"}');
  // }
   setId(id) async {
    await storage.write(key: 'id', value: id);
  }

   setCreatedAt(createdAt) async {
    await storage.write(key: 'createdAt', value: createdAt);
  }
   emailVerifiedAt(email_verified_at) async {
    await storage.write(key: 'email_verified_at', value: email_verified_at);
  }

  removeStorage() async {
    await storage.deleteAll();
  }

  Future get sessionData async {
    var session = await storage.readAll();
    return session;
  }

  Future get location async {
    var location = await storage.read(key: 'location');
    print(location);
    return location;
  }

  Future<String> get jwtOrEmpty async {
    
    var jwt = await storage.read(key: "token");
    // print('jwt: $jwt');
    if (jwt == null) return '';

    // check if token has expired or not
    // var expiredAt = await storage.read(key: 'token_expires_at');
    // if (expiredAt == null) {
    //   throw 'Login Session Expired!\nPlease Logout and Login again.';
    // }
    // var expiryDate = DateTime.parse(expiredAt);
    // print(expiryDate.isAfter(DateTime.now()).toString());

    // if (expiryDate.isAfter(DateTime.now().subtract(const Duration(hours: 1)))) {
      return jwt;
    // } else {
    //   print('Token has EXPIRED');
    //   throw 'Login Session Expired!\nPlease Logout and Login again.';
    // }
  }

  Future<String> get roleOrEmpty async {
    var name = await storage.read(key: "role");
    if (name == null) return "";
    return name;
  }

  Future<String> get nameOrEmpty async {
    var name = await storage.read(key: "name");
    if (name == null) return "";
    return name;
  }

  Future<String> get emailOrEmpty async {
    var email = await storage.read(key: "email");
    if (email == null) return "";
    return email;
  }

  // post(String s, Register body) {}
}
