# Recipies

Realm+
Alamofire+
ObjectMapper+
SDWebImage

PROBLEM:

Requirements

•	You can use any third-party library you find useful ✔
•	You MUST use Swift 3 for iOS 9+ apps. ✔
•	You MUST name all labels, variable names, etc., in english. ✔
•	Try to write your code in a way so that others can easily understand and extend it ✔
•	Comments/Document are very welcome ✔
•	You SHOULD write tests. UITests ✔ 

Exercise
Build an app in which:
•	The content in the first screen is loaded dynamically from the JSON file attached.  ✔
•	It has a login form for signing in with a valid email and a password. ✔
•	Each recipe can be marked as favorite/unfavorite ✔
•	Each recipe can be rated/unrated ✔
•	Of course since there's no server side component, the server requests will fail. This is expected. However, client side validation before submitting forms MUST be implemented. ✔
•	You MUST implement a fluid layout, that adapts to any device dimensions and orientation. ✔

SOLUTION:
Apart from all of above requirements, solution covers following

✔       Separate Network, DataBase Caching, Model and Controller layers to make project more scaleable, 
✔       Reduced coupling, small file sizes, simplicity make it effective for new coders to extend it.
✔       Realm is used to handle Models and DataBase Object at same level and handle high level of concurrency without much hassle in long running secure operations
✔       Image caching is handed via SDWebImage
✔       Login Form handles validation closely at UI level via extension and feels reactive
✔       Physical groups are grouped to depict shape of real big project
✔       Test Cases covers validation, data fetching and tableviews. 


INSTALLATION:


Once downloaded please open terminal and run following command

$cd: pathToCodeChallenge
$ pod install

If there are any questions please let me know.




