# MiniApp
This is a Simple Word Game and below are the Actions/functionalities required:
1. Users can input a word and the app checks if it’s a valid word (using a predefined list of words stored in Firebase).
2. Displays a score based on the number of valid words input by the user.
3. Provides feedback for correct and incorrect words.



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

## AUTHENTICATION
1. Create an account using the register page and you will be automatically logged in
2. OR login use my credentials below:
email: marvinrusoke@gmail.com
password: #Marvinbreezy4

## SAMPLE UI DESIGNS FROM THE APP
![Screenshot_20240625-111234](https://github.com/RusokeMarvin/MiniApp/assets/101735380/45f4a5d3-56f6-4e6d-8a7c-b07a6ee80cd8)
![Screenshot_20240625-104737](https://github.com/RusokeMarvin/MiniApp/assets/101735380/66b3e0d3-b1b2-4972-82b4-1fe466dbb4e1)
![Screenshot_20240625-104731](https://github.com/RusokeMarvin/MiniApp/assets/101735380/9e7fa369-f661-4b10-b846-6bc4bdd4e3de)
![Screenshot_20240625-105116](https://github.com/RusokeMarvin/MiniApp/assets/101735380/b82ae761-6371-4366-9f85-7d6e9030f4e3)
![Screenshot_20240625-105101](https://github.com/RusokeMarvin/MiniApp/assets/101735380/3f88b97d-3882-41fd-ad66-75ee4ff1dce8)
![Screenshot_20240625-105045](https://github.com/RusokeMarvin/MiniApp/assets/101735380/48a143a1-bdc1-428c-bbbc-f888708364f7)
![Screenshot_20240625-104904](https://github.com/RusokeMarvin/MiniApp/assets/101735380/dc05ee04-50e1-42c9-b450-026e4c99703d)
![Screenshot_20240625-104900](https://github.com/RusokeMarvin/MiniApp/assets/101735380/7399fafb-aa40-4d8f-8ab5-16da85f5a55d)



