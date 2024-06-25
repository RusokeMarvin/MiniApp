# MiniApp
This is a Simple Word Game and below are the Actions/functionalities required:
o Users can input a word and the app checks if it’s a valid word (using a predefined list of words stored in Firebase).
o Displays a score based on the number of valid words input by the user.
o Provides feedback for correct and incorrect words.



## FIREBASE INTEGRATION
I used firebase realtime database where i was able to export my words.json into it. The file contains the following data whish is needed to get 10/10 scores;
{
  "words": {
    "0": "apple",
    "1": "banana",
    "2": "cherry",
    "3": "mango",
    "4": "pineapple",
    "5": "lemon",
    "6": "matermelon",
    "7": "pawpaw",
    "8": "strawberry",
    "9": "avocados"
  }
}

## APP INSTALLATION COMMANDS(commands in bracket)
1. Open Terminal
2. Clone the Repository(https://github.com/RusokeMarvin/MiniApp.git) OR (just download the folder as a zip file from here)
3. Navigate to the Project Directory(cd MiniApp)
4. Install Dependencies(flutter pub get) or (Goto pubspec.yaml file and press ctrl+s): incase of any dependency conflicts adjust on the dependency versions
5.  Run the Flutter App(flutter run)
6.  To get highest scores, use the fruit names above

