class Users {
  final String name;
  final int age;
  final String phone;

//<editor-fold desc="Data Methods">
  const Users({
    required this.name,
    required this.age,
    required this.phone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Users &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          phone == other.phone);

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ phone.hashCode;

  @override
  String toString() {
    return 'Users{' + ' name: $name,' + ' age: $age,' + ' phone: $phone,' + '}';
  }

  Users copyWith({
    String? name,
    int? age,
    String? phone,
  }) {
    return Users(
      name: name ?? this.name,
      age: age ?? this.age,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'age': this.age,
      'phone': this.phone,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      name: map['name'] as String,
      age: map['age'] as int,
      phone: map['phone'] as String,
    );
  }

//</editor-fold>
}
