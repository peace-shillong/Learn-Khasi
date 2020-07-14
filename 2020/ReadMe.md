# Read Me : Log 

UI inspired 

https://dribbble.com/shots/4237110-Korean-Learning-App-Process-Dictionary-Function

*SESSION 1*

Welcome Fragment

https://www.colorbook.io/hexcolors/view/6200ee

*SESSION 2*
Welcome Done

https://firebase.google.com/docs/database/security/indexing-data?authuser=0

https://firebase.google.com/docs/database/android/read-and-write

https://firebase.google.com/docs/database/android/lists-of-data


Working on :
 
 Home Fragment 
 
 Word Fragment

11:43 PM 14/07/2020
Disable space  in word Search

Permission denied on Auth User data in realtime db

Had to change Firebase rules
```
"users": {
".read": true,
    "$uid": {        
    ".write": "$uid === auth.uid"
  }
}
```

12:27 AM 15/07/2020
Todo 
Search Text in ActionBar of Activity

