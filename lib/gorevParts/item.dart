



class Gorev {
  String not;
  bool isDone;
  Gorev({this.not = '', this.isDone = false});

  void togglesStatus() {
    isDone = !isDone;
  }



  Gorev.fromMap(Map<String,dynamic> map):
      not=map['not'],
      isDone=map['isDone'];



   Map<String,dynamic> toMap() => {
      'not' : not,
      'isDone':isDone
    } ;
}
