<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Firebase Auth</title>
  <!-- Include Firebase SDK -->
  <script src="https://www.gstatic.com/firebasejs/10.5.0/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/10.5.0/firebase-auth.js"></script>
</head>
<body>
  <button id="googleSignInBtn">Sign in with Google</button>
  <button id="logoutBtn" style="display:none;">Log Out</button>

  <script>
    // Firebase configuration
    const firebaseConfig = {
      apiKey: "YOUR_API_KEY",
      authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_PROJECT_ID.appspot.com",
      messagingSenderId: "YOUR_SENDER_ID",
      appId: "YOUR_APP_ID"
    };

    // Initialize Firebase
    const app = firebase.initializeApp(firebaseConfig);
    const auth = firebase.auth();

    // Handle Google Sign-In
    const provider = new firebase.auth.GoogleAuthProvider();

    document.getElementById('googleSignInBtn').addEventListener('click', () => {
      firebase.auth().signInWithPopup(provider)
        .then((result) => {
          const user = result.user;
          alert(`Welcome, ${user.displayName}!`);
          document.getElementById('logoutBtn').style.display = 'block';
          document.getElementById('googleSignInBtn').style.display = 'none';
        })
        .catch((error) => {
          console.error("Error during sign-in:", error);
        });
    });

    // Handle Logout
    document.getElementById('logoutBtn').addEventListener('click', () => {
      firebase.auth().signOut()
        .then(() => {
          alert('You have logged out.');
          document.getElementById('logoutBtn').style.display = 'none';
          document.getElementById('googleSignInBtn').style.display = 'block';
        })
        .catch((error) => {
          console.error("Error during logout:", error);
        });
    });
  </script>
</body>
</html>
