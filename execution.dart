import 'dart:io';
import 'dart:core';
import 'parcel.dart';
import 'dart:convert';

var now = new DateTime.now();

//LIST STUFF
int row = 30;
int col = 5;
dynamic pList = List.generate(row, (i) => List(col), growable: false);
//LIST STUFF

main() async {
  int choice; // loop flag

  // initialising end
  print(r"""\

______  ___  ______  _____  _____ _                                  
| ___ \/ _ \ | ___ \/  __ \|  ___| |                                 
| |_/ / /_\ \| |_/ /| /  \/| |__ | |                                 
|  __/|  _  ||    / | |    |  __|| |                                 
| |   | | | || |\ \ | \__/\| |___| |____                             
\_|   \_| |_/\_| \_| \____/\____/\_____/                           
__  ___  ___   _   _   ___  _____  ________  ___ _____ _   _ _____  
|  \/  | / _ \ | \ | | / _ \|  __ \|  ___|  \/  ||  ___| \ | |_   _| 
| .  . |/ /_\ \|  \| |/ /_\ \ |  \/| |__ | .  . || |__ |  \| | | |   
| |\/| ||  _  || . ` ||  _  | | __ |  __|| |\/| ||  __|| . ` | | |   
| |  | || | | || |\  || | | | |_\ \| |___| |  | || |___| |\  | | |   
\_|  |_/\_| |_/\_| \_/\_| |_/\____/\____/\_|  |_/\____/\_| \_/ \_/   
 _______   _______ _____ ________  ___                               
/  ___\ \ / /  ___|_   _|  ___|  \/  |                               
\ `--. \ V /\ `--.  | | | |__ | .  . |    uWu                        
 `--. \ \ /  `--. \ | | |  __|| |\/| |                               
/\__/ / | | /\__/ / | | | |___| |  | |                               
\____/  \_/ \____/  \_/ \____/\_|  |_/              


""");

  do {
    print("Today's Date:  $now");
    try {
      print(r"""\
  ____       __  _             
 / __ \___  / /_(_)__  ___  ___
/ /_/ / _ \/ __/ / _ \/ _ \(_-<
\____/ .__/\__/_/\___/_//_/___/
    /_/                        

  1. Insert Parcel
  2. View Parcels
  3. Increase the date by one day.
  4. Exit
  """);

      choice = int.parse(stdin.readLineSync());
      switch (choice) {
        case 1:
          {
            insertParcel();
            print("\n\n\n\n\n\n");
            continue;
          }
        case 2:
          {
            viewParcel();
            sleep(const Duration(seconds: 2));
            print("\n\n\n");
            continue;
          }
        case 3:
          {
            print("\n\n\n");
            now = now.add(new Duration(days: 1));
            parcelDeletion();
            print("One day has passed!");
            print("\n\n\n");

            continue;
          }
      }
    } catch (e) {
      print(e);
    }
  } while (choice != 4);
} //end of main

void insertParcel() {
  int houseNum;
  while (true) {
    print("Which house do you want to insert a parcel? [1-30]: ");
    try {
      houseNum = int.parse(stdin.readLineSync());
      if (houseNum < 1 || houseNum > 30) {
        print("That ain't between 1 and 30. Try again :");
      } else {
        print("Give a parcelname");
        String pName = stdin.readLineSync();
        houseNum--;
        for (int i = 0; i < 5; i++) {
          if (pList[houseNum][i] == null) {
            pList[houseNum][i] = new Parcel(pName);
            break;
          } else {
            print(
                "It seems like this house is full of parcels! Let's start over");
            break;
          }
        }
        break;
      }
    } catch (e) {
      print("Please put in a number between 1-30 please.");
    }
  }
}

void viewParcel() {
  while (true) {
    print("Select a house to view [1-30]:");
    try {
      int houseNum = int.parse(stdin.readLineSync());
      if (houseNum < 1 || houseNum > 30) {
        print("That ain't correct chief, try again.");
      } else {
        houseNum--;
        for (int i = 0; i < 5; i++) {
          if (pList[houseNum][i] != null) {
            print(
                "Parcel ${i + 1} : ${pList[houseNum][i].ParcelName} \t Parcel Date: ${pList[houseNum][i].date} ");
          } else
            print("Parcel Slot ${i + 1} is empty!");
          continue;
        }
        break;
      }
    } catch (e) {
      print("Can you not input a correct number?");
    }
  }
}

void parcelDeletion() {
  var difference;
  for (int i = 0; i < 30; i++) {
    for (int j = 0; j < 5; j++) {
      if (pList[i][j] != null) {
        difference = now.difference(pList[i][j].date);
        if (difference.inDays >= 2) {
          print("ITS DIFFERENT");
          pList[i][j] = null;
        }
      }
    }
  }
}
