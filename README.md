# Flutter Article App

## Features
- List of articles
- Search functionality by Title and ID
- Detail view
- Responsive UI using MediaQuery
- Pull to Refresh
- Favorite Page with Functionality
- Shared preferences to Store Favorites
- Smooth Navigation Bar
 
## Setup Instructions
  1. Clone the repo:
      - git clone https://github.com/Smiteshbhore21/BharatNXT---Task.git
      - cd article
  2. Install dependencies:
      - flutter pub get
  4. Run the app:
      - flutter run

## Tech Stack
- Flutter SDK: 3.24.4
- State Management: Change Notifier Provider
- HTTP Client: http
- Persistence: shared_preferences

## State Management Explanation
- **Provider + ChangeNotifier**  
  - Chosen for its simplicity and suitability for apps with a moderate amount of mutable state.  
  - Allows listeners to rebuild only the parts of the UI that depend on changed data.  

- **Ephemeral State**  
  - Local widget state managed with `setState` where appropriate for UI-specific changes.

## Known Issues / Limitations
- Caching of API responses is not implemented—every refresh fetches data from the network.
- No pagination; large data sets may affect performance.
- Error handling and offline support can be improved.
- Search Feature can be improved.
- SQFlite can be used to access previously fetched data offline.
  
## Screenshots (Optional)
![Screenshot_1746975125](https://github.com/user-attachments/assets/d98a70b3-5e01-4443-aa6d-7d5fc76008ef)
![Screenshot_1746975096](https://github.com/user-attachments/assets/6cbb0fdc-316d-4b68-851a-8551e80bd014)
![Screenshot_1746975085](https://github.com/user-attachments/assets/f3555fab-588f-4d06-a351-3944792f06df)
![Screenshot_1746975147](https://github.com/user-attachments/assets/59b051fb-65c1-4d6b-a44b-aca72d35c332)
![Screenshot_1746975141](https://github.com/user-attachments/assets/7e3385e8-48ff-4d1c-922e-a944ff2ed47e)
![Screenshot_1746975138](https://github.com/user-attachments/assets/377e1573-68cf-44ff-b781-9b4f70632bf9)
![Screenshot_1746975132](https://github.com/user-attachments/assets/6c692d08-356a-4b75-9c8b-0a3904bef748)
