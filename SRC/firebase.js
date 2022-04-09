// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAxPcWvLCQriV76f0RDHlNHMTsk-mrT5D0",
  authDomain: "happiness-45c70.firebaseapp.com",
  projectId: "happiness-45c70",
  storageBucket: "happiness-45c70.appspot.com",
  messagingSenderId: "566983852160",
  appId: "1:566983852160:web:880db39fb9338f86fbe665",
  measurementId: "G-DLTL75TSCP"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);