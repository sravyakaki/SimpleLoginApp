# SimpleLoginApp
This simple application shall allow the user to enter a username and password to login to the app. The user shall then be greeted with a welcome screen along with the username they used to login.

# Design Pattern Used
1. App is designed by following the principles of MVVM design architecture/pattern
2. Protocols, Delegates and Segues are used to establish communication between different view controllers. Data transfer between the view controllers takes place through a segue.

# Validation Checks In Login Screen:
1. Username and Password fields cannot be left empty. If user attempts to proceed, the app shall throw a popover alert. 
2. If either of the Username or Password fields are left empty, the app will display a popover as mentioned above along with highlighting the empty textfield in red.
3. The Username and Password field should both contain a minimum of one character and one numeric, else the app shall display a popover error stating the same.

# UI And Unit Tests
1. UI Tests are written for the login screen to validate the inputs by supplying dummy values

# Mock JSON File and API Handler
1. Files in Model folder have been written to handle the mock API call and success response from the json file. Credentials folder is setup as a singleton class to update and share the user credentials throughout the app. However, the mock setup isn't generating the response as I intended it to, hence a different approach has been followed.

