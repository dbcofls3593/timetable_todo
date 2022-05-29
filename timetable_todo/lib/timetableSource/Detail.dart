class Detail{
  int? color;
  String? subjects;
  String? professor;
  String? days;
  String? start;
  String? end;
  String? place;
  String? todotext;

  Detail(int color, String subjects, String professor, String days, String start, String end, String place, String todotext){
    this.color = color;
    this.subjects = subjects;
    this.professor = professor;
    this.days = days;
    this.start = start;
    this.end = end;
    this.place = place;
    this.todotext = todotext;
  }

  void printdetail(){
    print('Object delivery successful\n');
    print("Object is ${this.color}, ${this.subjects}, ${this.professor}, ${this.days}, ${this.start}, ${this.end}"
        ", ${this.place}, ${this.todotext}");
  }

}