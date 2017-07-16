import XCTest
@testable import CodeChallenge

class RecipiesViewControllerTests: XCTestCase {

    var recipiesViewController: RecepiesViewController!
    
    override func setUp() {
        
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        recipiesViewController = storyboard.instantiateViewController(withIdentifier: "RecepiesViewController") as! RecepiesViewController
        _ = recipiesViewController.view
    }
    
    func testTableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(recipiesViewController.tableView)
    }
    
    func testShouldSetTableViewDataSource() {
        XCTAssertNotNil(recipiesViewController.tableView.dataSource)
    }
    
    func testShouldSetTableViewDelegate() {
        XCTAssertNotNil(recipiesViewController.tableView.dataSource)
    }
    
    func testConformsToTableViewDataSourceProtocol() {
        
        XCTAssert(recipiesViewController.conforms(to: UITableViewDataSource.self))
        
        XCTAssert(recipiesViewController.responds(to: #selector(recipiesViewController.numberOfSections(in:))))
        
        XCTAssert(recipiesViewController.responds(to: #selector(recipiesViewController.tableView(_:numberOfRowsInSection:))))
        
        XCTAssert(recipiesViewController.responds(to: #selector(recipiesViewController.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewUsesCustomCell_RecepiesTableViewCustomCell() {
        
         let firstCell = recipiesViewController.tableView(recipiesViewController.tableView, cellForRowAt: IndexPath.init(row: 0, section: 0))
        
        XCTAssert(firstCell is RecepiesTableViewCustomCell)
    }
    
    func testConformsToTableViewDelegateProtocol() {
        
        XCTAssert(recipiesViewController.conforms(to: UITableViewDelegate.self))
        
        XCTAssert(recipiesViewController.responds(to: #selector(recipiesViewController.tableView(_:didSelectRowAt:))))
    }
    
}
