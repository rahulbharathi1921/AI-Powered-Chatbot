# AI-Powered-Chatbot

🤖 AI Chatbot (Flutter + Gemini API)

This is a modern AI-powered chatbot built using Flutter and Google's Gemini API, designed with a scalable MNC-style project structure.
It supports Markdown responses, a typing indicator, and an interactive chat UI similar to professional messaging apps.

🚀 Features

🔹 Google Gemini API Integration – AI-powered intelligent responses

🔹 Clean Architecture – Organized into model, services, and ui

🔹 Interactive AppBar – Shows bot status (Online / Typing)

🔹 Markdown Rendering – Supports tables, lists, and formatted text

🔹 Typing Indicator – Realistic conversation feel

🔹 Offline-ready Structure – Easy to switch to rule-based or hybrid chatbot


📂 Project Structure

lib/
 ├── model/
 │     └── message.dart
 ├── services/
 │     └── api_service.dart
 ├── ui/
 │     └── chat_screen.dart
 └── main.dart
 
🛠️ Prerequisites

Flutter SDK (latest stable version)

VS Code or Android Studio

Google Cloud account for Gemini API key


🔑 Get Gemini API Key

Go to Google AI Studio

Sign in with your Google account

Click Create API Key

Copy the generated API key

Replace the placeholder in api_service.dart:


String apiKey = "YOUR_GEMINI_API_KEY_HERE";


⚙️ Installation


Clone the repository

git clone https://github.com/your-username/flutter-gemini-chatbot.git
cd flutter-gemini-chatbot


Install dependencies

flutter pub get

Run the app

On Chrome (Web):


flutter run -d chrome

On Android device:


flutter run

📱 Building APK

To build a release APK:


flutter build apk --release

The generated APK will be available at:


build/app/outputs/flutter-apk/app-release.apk


🧩 How It Works

User sends a message →

Gemini API generates a response →

Bot replies in Markdown →

UI renders formatted text with a typing effect


📌 Future Enhancements

🔹 Add rule-based + AI hybrid fallback

🔹 Integrate Firebase Authentication

🔹 Enable Voice input/output

🔹 Add Dark Mode


🤝 Contributing

Pull requests are welcome! If you want to add features or fix bugs, please open an issue first to discuss what you’d like to change.

🛡️ License
This project is licensed under the MIT License.
