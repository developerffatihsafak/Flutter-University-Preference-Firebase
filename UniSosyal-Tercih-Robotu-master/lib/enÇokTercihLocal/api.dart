class OgrenciSayisi {
final String name;
 final String  aciklamasi;
 final String ortalamaMaas;

    
  const OgrenciSayisi ({
     this.name,
     this.aciklamasi,
     this.ortalamaMaas,
   
  });

  factory OgrenciSayisi.fromJson(Map<String, dynamic> json) => OgrenciSayisi(
       name : json['name'],
    aciklamasi : json['aciklamasi'],
    ortalamaMaas : json['ortalamaMaas'],
  
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'aciklamasi': aciklamasi,
        'ortalamaMaas': ortalamaMaas,
        
       
      };
}
