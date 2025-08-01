# **Tajdor**  

<img width="1600" height="960" alt="Cover (5)" src="https://github.com/user-attachments/assets/9af81b1f-c07b-4e7a-a7f3-6afb2562e9ff" />

---

## **Index**
1. [Description](#description)  
2. [Features](#features)  
3. [Usage](#usage)  
4. [Screen Structure](#screen-structure)  
   - [Splash Screen](#1-Splash-Screen)  
   - [Login Screen](#2-login-screen)  
   - [Sign Up Screen](#3-sign-up-screen)  
   - [Home Screen](#4-home-screen)  
   - [Map Screen](#5-Map-Screen)
   - [Tank Detail](#6-Tank-Detail)
   - [Settings Screen](#7-Tank-Detail)
5. [Setup Instructions](#setup-instructions)  
   - [Clone the Repository](#clone-the-repository)  
   - [Install Dependencies](#install-dependencies)  
   - [Running the Application](#running-the-application)  
6. [Future Work](#future-work-for-the-indoor-plant-care-application)


--- 
## **Description**  
Fog Nets efficiently collect water droplets from the air in smart collection tanks that store distilled water with filling sensors and an automatic irrigation system, then deliver water to plants based on actual need. They are connected to a digital control panel to display tank status and alerts via the app **Planto**.  

---

## **Features**  
- **Real-time** tank level tracking
- **Interactive map** with pin-based tank selection
- **7-day water** usage graph.
- **Smart irrigation** suggestions
- **Field photo upload** functionality


---

## **Usage**  
1. **Navigate to the Home tab to browse all tanks**  
   
2. **Use the Map tab to visually locate tanks**

3. **Tap on a tank to view detailed stats**

4. **Access Alerts or Settings**

5. **Upload updates directly from the tank detail view**
  

---


## **Screen Structure**  
The app consists of the following screens:  

### 1. **Splash Screen**
Displays app logo briefly before navigating to login/signup.

---

### 2. **Login Screen**
Authenticates users with email and password.

---

### 3. **Sign Up Screen**
Registers new users with validation and secure input.

---

### 4. **Home Screen**

Displays a searchable list of tanks with their current water levels and update timestamps.

---

### 5. **Map Screen**
Uses MapKit to show annotated pins for each tank.

Tapping a pin opens a sliding bottom sheet with tank details and insights.

---

### 6. **Tank Detail**
Contains:

- Tank name, image, fill percentage

- Last update time

- Graph of past 7-day levels

- Irrigation suggestions

- Field update upload (camera icon)

---
### 7. **Settings Screen**
Placeholder for user preferences (theme, notifications, etc.)


 ## Setup Instructions

### Clone the Repository
To get started, clone the repository by running the following command in your terminal:
```sh
git clone https://github.com/Noura-sun/TR.git
cd TR
```
### Install Dependencies

- Requires Xcode 15+

- Make sure to add image assets: stats, tank images, and SF Symbols
 
### Running the Application 
   ```sh
   open TRApp.xcodeproj
   ```

#  Future Work :

- Integrate Firebase or AWS for live tank data

- Add user role management (admin, technician, viewer)

- Offline data sync and caching

- Push notifications for critical alerts

- Localization for English and Arabic









