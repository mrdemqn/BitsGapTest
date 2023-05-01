## Application with two screens.
# On the first screen:
# Logo (Three dribble)
# Pageview:
   - on the first element there are two text fields (username and password) for entering the application,
   - on the second element there are three text fields (email, username and password) for registering in the application
Also click "Login" and "Register" to enter and register
"Forgot password" text with no action

## Getting Started

# The application allows you to register
   - when registering, you must enter email, username and password in the text input fields. The email field has a check for allowed and required characters corresponding to the concept of email. The fields also have a check for the length of characters (no more than 20 and no less than one)
   - there are checks for empty fields and an attempt to register an existing user (the check occurs by the username parameter). If the fields are not validated, an error interface will appear
   - if all text fields passed the checks, then when you click on the "Register" button, the user will be placed in the local storage "SharedPreferences"
   - after pressing the "Register" button, a bootloader appears in the middle of the screen, we are waiting for an artificial delay per second
   - after the user has been registered, a message appears at the top of the screen about successful registration 

# The application allows you to login
   - to enter, the user must enter the username and password of a previously registered user
   - there are also checks for empty fields and a check for a user that does not exist and a check for an incorrect password. If the fields are not validated, an error interface will appear
   - after clicking on the "Login" button, the loader appears in the middle of the screen, we are waiting for an artificial delay per second
   - after a successful login, we go to the next LogOut screen

# Others
   - when you click on the logo in the upper left corner of the screen, the theme of the application changes
   - initially the theme of the application is dark, when you click you can change it to light and vice versa

# The LogOut screen
   - this screen also has a logo
   - when you click on the logo in the upper left corner of the screen, the theme of the application changes
   - initially the theme of the application is dark, when you click you can change it to light and vice versa
   - in the middle of the screen there is a "Logout" button, when clicked, the user saved in the local storage as the current logged in is deleted