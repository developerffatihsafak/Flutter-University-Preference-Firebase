class UniversiteApi {
final String name;
 final String  phone;
 final String fax;
  final String website;
  final String email;
  final String adress;
  final String rector;
    
  const UniversiteApi ({
     this.name,
     this.phone,
     this.fax,
     this.website,
     this.email,
     this.adress,
     this.rector,
  });

  factory UniversiteApi.fromJson(Map<String, dynamic> json) => UniversiteApi(
       name : json['name'],
    phone : json['phone'],
    fax : json['fax'],
    website : json['website'],
    email : json['email'],
    adress : json['adress'],
    rector : json['rector'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'fax': fax,
        'website': website,
        'email': email,
        'adress': adress,
        'rector': rector,
       
      };
}
