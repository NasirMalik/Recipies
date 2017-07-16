import XCTest


class CodeChallengeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: LOGIN (All Cases)
    func testLoginWithoutEnteringData(){
        let app = XCUIApplication()
        app.buttons["login"].tap()
        
        XCTAssertFalse(!app.buttons["login"].exists)
    }
    
    func testLoginWhenEmailIsInvalid(){
        let app = XCUIApplication()
        performLogin(app: app, username:"nasir@snapp", password: "123456")
        
        XCTAssertFalse(!app.buttons["login"].exists)
    }
    
    func testLoginWhenPasswordIsInvalid(){
        let app = XCUIApplication()
        performLogin(app: app, username:"nasir@snapp.ae", password: "1234")
        
        XCTAssertFalse(!app.buttons["login"].exists)
    }
    
    func performLogin(app:XCUIApplication, username:String, password:String){
        
        let usernameTextField = app.textFields["email"]
        usernameTextField.tap()
        usernameTextField.typeText(username)
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(password)
        
        app.buttons["login"].tap()
    }
}
