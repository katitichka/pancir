import 'dart:io';
import 'dart:math';

void main() {
  print(
    "Привет! Давай начнем игру, попробуй угадать число, которое я загадал (от 1 до 100) за наименьшее число попыток!",
  );
  bool playAgain = true;
  while (playAgain) {
    final random = Random();
    int randNum = random.nextInt(101);
    bool flag = false;
    int count = 0;
    while (!flag) {
      int userNum = getNum();
      count += 1;
      flag = compare(userNum, randNum, count);
    }
    playAgain = askToPlay();
  }
  print("Спасибо за игру!");
}

bool compare(userNum, int randNum, int count) {
  if (userNum < randNum) {
    print("Слишком мало");
    return false;
  } else if (userNum > randNum) {
    print("Слишком много");
    return false;
  } else {
    print("Правильно! Количество попыток, которое тебе понадобилось: $count");
    return true;
  }
}

int getNum() {
  while (true) {
    stdout.write('Введи число: ');
    try {
      int input_num = int.parse(stdin.readLineSync()!);
      if (input_num > 100 || input_num < 1) {
        print("Введите число от 1 до 100");
      } else {
        return input_num;
      }
    } catch (e) {
      print('Пожалуйста, введите корректное число!');
    }
  }
}

bool askToPlay() {
  while (true) {
    stdout.write('Хотите сыграть еще раз? (Y/N): ');
    String? input = stdin.readLineSync()?.toUpperCase();
    if (input == 'Y') {
      return true;
    } else if (input == 'N') {
      return false;
    } else {
      print("Неверный ввод. Пожалуйста введи Y или N");
    }
  }
}
