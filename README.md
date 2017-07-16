# Recipies
Realm+Alamofire+ObjectMapper

PROBLEM:
The goal of this test is to assert (to some degree) your coding skills.

Feel free to add at any point any particular technique or algorithm that you think might enrich the overall quality of the end result.
You're allowed and encouraged to use third party libraries, as long as you put them together yourself without relying on a framework to do it for you.
An effective developer knows what to build and what to reuse, but also how his tools work. Be prepared to answer some questions about those packages.
There is no time limit (you shouldn’t spend a week, though) - but please honestly tell us how long you needed.
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
Apart from all of above requirements

✔       Separate Network, DataBase Caching, Model and Controller layers to make project more scaleable
✔       Realm is used to handle Models and DataBase Object at same level and handle high level of concurrency without much hassle in long running secure operations
✔       Image caching is handed via SDWebImage
✔       Login Form handles validation closely UI level via extension and feels reactive
✔       Physical groups are grouped to depict shape of real big project
✔       Test Cases still needs to be worked on. 


INSTALLATION:


Once downloaded please open terminal and run following command

$cd: pathToCodeChallenge
$ pod install

If there are any questions please let me know.




