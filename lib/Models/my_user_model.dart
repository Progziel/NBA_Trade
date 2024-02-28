class MyUserModel{
  String? userId;
  String? fullName;
  String? email;
  String? address;
  String? phone;
  String? profilePicUrl;
  String? password;

  MyUserModel({this.fullName,this.email,this.userId,this.address,this.phone,this.profilePicUrl,this.password});

  static MyUserModel fromMap(Map<String,dynamic> map) => MyUserModel(
    userId: map['userId'],
    fullName: map['fullName'],
    email: map['email'],
    address: map['address'],
    phone: map['phone'],
    profilePicUrl: map['profilePicUrl'],
    password: map['password'],
  );

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'fullName': fullName,
    'email' : email,
    'address' : address,
    'phone' : phone,
    'profilePicUrl' : profilePicUrl,
    'password' : password
  };

}