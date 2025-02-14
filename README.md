# explore

# 🌍 Multi-Language Selection & Filtering Bottom Sheet App

This Flutter app provides a **seamless user experience** for selecting languages and applying filters using a **custom bottom sheet UI**, built with **GetX** for state management.

---

## 📌 Features

✅ **Multi-Language Selection:**  
- Displays a list of languages with **radio buttons** to select one.  
- Selection is retained when the bottom sheet is reopened.  

✅ **Filter Bottom Sheet:**  
- Allows users to filter continents and time zones using **checkboxes**.  
- Includes **reset & apply buttons** for better user experience.  

✅ **Custom UI & Theme Support:**  
- Designed to **match the app's theme** dynamically.  
- Uses **GetX** for state management.  

✅ **Network Permissions Setup (Android):**  
- **Internet access enabled** to fetch external data.  
- Cleartext traffic allowed for **non-HTTPS** requests.  

---

## 🚀 Getting Started

### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/kr3a7ion/explore.git
cd your-repo
```

### **2️⃣ Install Dependencies**
```sh
flutter pub get
```

### **3️⃣ Run the App**
```sh
flutter run
```

---

## ⚙️ Android Network Configuration

To enable network access in **Android**, ensure your `AndroidManifest.xml` file contains:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
```

For **HTTP (non-HTTPS) requests**, allow cleartext traffic:
```xml
<application android:usesCleartextTraffic="true">
```

---

## 🛠️ Technologies Used

- **Flutter** (UI Framework)  
- **Dart** (Programming Language)  
- **GetX** (State Management)  
- **Material Design** (UI Components)  

---

