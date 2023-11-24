class UserAddress{
  String cCountry;
  String cRegion;
  String cZone;
  String cSubCity;
  String cPoBox;



  UserAddress(
      this.cCountry,
      this.cRegion,
      this.cZone,
      this.cSubCity,
      this.cPoBox,

      );




  Map<String, dynamic> toJson()=>
      {

        'cCountry':  cCountry,
        'cRegion': cRegion,
        'cZone': cZone,
        'cSubCity': cSubCity,
        'cPoBox': cPoBox,

      };
}