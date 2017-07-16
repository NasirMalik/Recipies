/*
 
 NASIR MAHMOOD
 
 Comment:
 MODEL 
 Made with Realm and  MApper to automap s to RealmDatabase.
 
 */
import UIKit
import RealmSwift

class RecepiesViewController: UIViewController {
    
    /*fileprivate*/ var recipiesArray : [Reciepe] = [] // needed in tests
    @IBOutlet var tableView: UITableView!
    
    var tableViewEstimatedHight = Float?(194.0)
    var tableViewCellIdentifier = ""
    
    let numberOfSections = 1
    
    var realm : Realm?
    
    //MARK: UIView Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = RealmProvider.realm()
        tableView.estimatedRowHeight = CGFloat(tableViewEstimatedHight!)
        tableView.rowHeight = UITableViewAutomaticDimension;

        title=ViewControllerTitles.Recipies
        navigationController?.navigationBar.tintColor = UIColor.red
        
        DataManager.sharedInstance.requestData { (recipiesArrayloc, error) in
            if let recipiesUnwrapped=recipiesArrayloc{
                self.recipiesArray=recipiesUnwrapped
                self.tableView.reloadData()
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

extension RecepiesViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipiesArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.Recipies)! as! RecepiesTableViewCustomCell
        if !recipiesArray.isEmpty {
            let reciepe = recipiesArray[indexPath.row]
            cell.populateReceiepeObject(reciepe)
            cell.favourtieButton.addTarget(self, action: #selector(favourtieButtonPressed), for: .touchUpInside)
            cell.clearButton.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
            cell.starView.didFinishTouchingCosmos = { rating in
                do{
                    try self.realm?.write {
                        reciepe.rating.value = Float(rating)
                        print("rating \(reciepe.rating.value)")
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                catch{
                    print("error saving object")
                }
            }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // segue with sender
    }
}

extension RecepiesViewController
{
    @objc fileprivate func clearButtonPressed(_ sender: UIButton) {
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:tableView)
        let indexpath = tableView.indexPathForRow(at: buttonPosition)
        let reciepe = recipiesArray[(indexpath?.row)!]
        do{
            try realm?.write {
                reciepe.rating.value = nil
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        catch{
            print("error writing object")
        }
        

        //set rating = 0
    }
    
    func favourtieButtonPressed(_ sender: UIButton) {
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:tableView)
        let indexpath = tableView.indexPathForRow(at: buttonPosition)
        let reciepe = recipiesArray[(indexpath?.row)!]
        do{
            var newVal = false
            if sender.isSelected {
                sender.isSelected=false
                newVal = false
            }
            else
            {
                newVal = true
                sender.isSelected=true
            }
            
            try realm?.write {
                reciepe.favorite.value = newVal
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        catch{
            print("error writing object")
        }
    }

}

