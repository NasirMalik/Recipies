import XCTest
@testable import CodeChallenge

class CodeChallengeTests: XCTestCase {
    
    var dataManager : DataManager?
    
    override func setUp() {
        super.setUp()
        
        dataManager = DataManager()

        let realm = RealmProvider.realm()
        try! realm?.write { () -> Void in
            realm?.deleteAll()
        }
        // add dummy data to database
    }
    
    // Currently will work only first time
    func testDataFetch() {
        
        let exceptionDesc: XCTestExpectation = self.expectation(description: "exception")
        
        dataManager?.requestData { (recipiesArray, dataError) in
            
            // 1. Non empty result
            XCTAssertTrue(recipiesArray?.count == 9)
        
            // Not Nil
            XCTAssertNotNil(recipiesArray?[0])
            
            // first object Data testing
            let firstObject = recipiesArray?[0]
            
            XCTAssertEqual(firstObject?.name, "Crispy Fish Goujons ")
            
            XCTAssertEqual(firstObject?.id, "533143aaff604d567f8b4571")
            
            XCTAssertEqual(firstObject?.proteins, "43 g")
            
            exceptionDesc.fulfill()
        }
        
        self.waitForExpectations(timeout: 20) { (error) in
           
            XCTAssertNil(error)
        }
    }
    
    
    

    
    
}
