import 'dart:math';
import 'package:validators/validators.dart';
// Stack Calculator
// A stack machine processes instructions by pushing and popping values to an
// internal stack. A simple example of this is a calculator.
//
//  The argument passed to stackCalc(instructions) will always be a string containing a series of instructions.
//  The instruction set of the calculator will be this:
//
//  +: Pop the last 2 values from the stack, add them, and push the result onto the stack.
//  -: Pop the last 2 values from the stack, subtract the lower one from the
//     topmost one, and push the result.
//  *: Pop the last 2 values, multiply, and push the result.
//  /: Pop the last 2 values, divide the topmost one by the lower one, and push the result.
//  DUP: Duplicate (not double) the top value on the stack.
//  POP: Pop the last value from the stack and discard it.
//  PSH: Performed whenever a number appears as an instruction. Push the number to the stack.
//  Any other instruction (for example, a letter) should result in the value
//  "Invalid instruction: [instruction]"

/// Examples
//  stackCalc("") ➞ 0
//  stackCalc("5 6 +") ➞ 11
//  stackCalc("3 DUP +") ➞ 6
//  stackCalc("6 5 5 7 * - /") ➞ 5
//  stackCalc("x y +") ➞ Invalid instruction: x
stackCalc(String inputString) {
  List<int> Stack=[];
  if(inputString==""){
    return 0;
  }
  List<dynamic>inputList = inputString.split(" ").toList();
  print("Input List=$inputList");
  while(inputList.isNotEmpty){
    if(isNumeric(readinputList(inputList))){
      print("Integer found");
      stackPush(int.parse(readinputList(inputList)),Stack);
      inputList.removeAt(0);
      print("Printing Stack");
      print(Stack);
      print("Printing inputList");
      print(inputList);
    }
    else  if(readinputList(inputList) == "DUP"){
      print("Duplicate");
      int temp=stackPop(Stack);
      print("Popping $temp from stack and pushing it two times");
      stackPush(temp, Stack);
      stackPush(temp, Stack);
      inputList.removeAt(0);
      print("Printing inputList");
      print(inputList);
    }
    else if(readinputList(inputList)=="+"){
      print("+ found");
      int temp=stackPop(Stack)+stackPop(Stack);
      print(temp);
      stackPush(temp, Stack);
      print(Stack);
      inputList.removeAt(0);
      print("Printing inputList");
      print(inputList);
    }
    else if (readinputList(inputList)=='-'){
      print("- found");
      int temp=stackPop(Stack)-stackPop(Stack);
      print(temp);
      stackPush(temp, Stack);
      print(Stack);
      inputList.removeAt(0);
      print("Printing inputList");
      print(inputList);
    }
    else if (readinputList(inputList)=='/'){
      print("/ found");
      int temp=stackPop(Stack)~/stackPop(Stack);
      print(temp);
      stackPush(temp, Stack);
      print(Stack);
      inputList.removeAt(0);
      print("Printing inputList");
      print(inputList);
    }
    else if (readinputList(inputList)=='*'){
      print("* found");
      int temp=stackPop(Stack)*stackPop(Stack);
      print(temp);
      stackPush(temp, Stack);
      print(Stack);
      inputList.removeAt(0); print("Printing inputList");
      print(inputList);

    }
    else{
      return 0;
    }

  }
  print("Input List Empty");
  return stackPop(Stack);

    }

 // print("hi");
 // return stackPop(Stack);



String readinputList(List<dynamic> inputList){
  return inputList[0];
}
void stackPush(int input, List<int> Stack){
  Stack.add(input);

}


int stackPop(List<int> Stack){
  if(Stack.isEmpty){
   throw Exception("Empty Stack");
  }
  else{
    int temp =Stack[Stack.length-1];
    Stack.removeLast();
    return temp;
  }

}




main() {
 print(stackCalc(""));
 print(stackCalc("5 6 +"));
  print(stackCalc("5 6 -"));
  print(stackCalc("5 6 /"));
print(stackCalc("5 6 *"));
  print(stackCalc("3 DUP +"));
 print(stackCalc("6 5 5 * -"));
  print(stackCalc("6 5 5 * 7 + -"));





}
