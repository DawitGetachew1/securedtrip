class UserDetail{
  String dateOfBirth;
  String cGender;




  UserDetail(
      this.dateOfBirth,
      this.cGender,


      );




  Map<String, dynamic> toJson()=>
      {

        'dateOfBirth':  dateOfBirth,
        'cGender': cGender,

      };
}