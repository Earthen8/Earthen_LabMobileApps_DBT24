import 'dart:io';

class Ujian {
  Map<String, int> studentGrades = {};

  void addStudent(String name, int grade) {
    studentGrades[name] = grade;
  }

  double calculateAverage() {
    if (studentGrades.isEmpty) return 0.0;
    int total = studentGrades.values.reduce((a, b) => a + b);
    return total / studentGrades.length;
  }
}

void main() {
  Ujian ujian = Ujian();

  for (int i = 0; i < 3; i++) {
    stdout.write('Input nama student: ');
    String? name = stdin.readLineSync();

    if (name != null && name.isNotEmpty) {
      stdout.write('Input nilai $name: ');
      String? gradeInput = stdin.readLineSync();
      int? grade = int.tryParse(gradeInput ?? '');

      if (grade != null) {
        ujian.addStudent(name, grade);
      }
    }
  }

  print('Average: ${ujian.calculateAverage()}');
}
