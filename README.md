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

