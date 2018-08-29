import UIKit

class BasketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Animations, TrackableMixin {
    
    let reuseIdentifier = "BasketCell"
    var user: User!
    
    let basketRequestFactory = ProductRequestFactory()

    var basket: [Product] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var customView: BasketView!
    
    
    @IBAction func pay(_ sender: UIButton) {
        buttonAnimation(button: sender)
        track(.pay(price: self.basket.map({$0.price}).reduce(0, +), success: true))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        basketRequestFactory.getBasket(userId: user.id, completionHandler: { response in
            switch response.result {
            case .success(let value):
                self.basket = value.products
                self.customView.total.text = "Total: \(value.amount)"
                self.tableView.reloadData()
            case .failure(let error):
                print("Error: \(error)")
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.basket[indexPath.row].name
        cell.detailTextLabel?.text = "\(self.basket[indexPath.row].price)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.basket.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.customView.total.text = "Total: \(self.basket.map({$0.price}).reduce(0, +))"
            self.track(.deleteFromBasket(
                price: self.basket[indexPath.row].price,
                productName: self.basket[indexPath.row].name))
        }
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        productCellAnimation(cell: cell)
    }
}
