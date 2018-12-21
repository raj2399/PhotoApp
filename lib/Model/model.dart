class Pic{


  final String status;
  Pic({this.status});
  static Pic fromJson(Map<String,dynamic> json){
    return Pic(
      status: json['Status']
    );
  }

}