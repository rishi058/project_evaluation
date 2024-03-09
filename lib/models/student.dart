class Student{
  int rollNumber ;
  String name;
  String emailId;
  bool isSelected;
  String ideation;
  String execution;
  String pitch;
  bool isLocked;


  Student({required this.rollNumber, required this.name, required this.emailId, required this.isSelected, required this.ideation, required this.execution, required this.pitch, required this.isLocked});

  void clear(){
    isSelected = false;
    ideation = '_';
    execution = '_';
    pitch = "_";
    isLocked = false;
  }

  void printDetails() {
    print('Roll Number: $rollNumber');
    print('Name: $name');
    print('Email ID: $emailId');
    print('Selected: $isSelected');
    print('Ideation Score: $ideation');
    print('Execution Score: $execution');
    print('Pitch Score: $pitch');
  }

}

List<Student> studentList = [
  Student(rollNumber: 101, name: "Aarav Sharma", emailId: "aaravsharma@gmail.com", isSelected: true, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 102, name: "Aditi Patel", emailId: "aditipatel@gmail.com", isSelected: true, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 103, name: "Aryan Gupta", emailId: "aryangupta@gmail.com", isSelected: true, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 104, name: "Ishaan Singh", emailId: "ishaansingh@gmail.com", isSelected: false, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 105, name: "Neha Kapoor", emailId: "nehakapoor@gmail.com", isSelected: false, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 106, name: "Riya Sharma", emailId: "riyasharma@gmail.com", isSelected: false, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 107, name: "Advait Kumar", emailId: "advaitkumar@gmail.com", isSelected: false, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 108, name: "Ishika Gupta", emailId: "ishikagupta@gmail.com", isSelected: false, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 109, name: "Vihaan Patel", emailId: "vihaanpatel@gmail.com", isSelected: false, ideation: '_', execution: '_', pitch: '_', isLocked: false),
  Student(rollNumber: 110, name: "Ananya Singh", emailId: "ananyasingh@gmail.com",isSelected: false,  ideation: '_', execution: '_', pitch: '_', isLocked: false),
];