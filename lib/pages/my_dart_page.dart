void main(){


}

abstract class Employ{
  String name;
  int baseSalary;

  Employ({required this.name,required this.baseSalary});

double calculateSalary();
 

 void getDetails(){
print('$name and $baseSalary');
 }
}

class Developer extends Employ{
  double bonus;
  Developer({required super.name, required super.baseSalary,required this.bonus});

  @override
  double calculateSalary() {
   double salary=baseSalary+bonus;
   return salary;
  }

@override
  void getDetails() {
 // 03048459970
  }
}

