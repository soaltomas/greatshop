import UIKit

class ProductListViewController: UITableViewController, UISearchBarDelegate, Animations, TrackableMixin {
    let reuseIdentifier = "ProductListCell"
    let productRequestFactory = ProductRequestFactory()
    
    var productList: [Product] = []
    var filteredProductList: [Product] = []

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredProductList = productList
        searchBar.delegate = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProductList.count
    }
    
    override func awakeFromNib() {
        productRequestFactory.getProductList(pageNumber: 1, categoryId: 1, completionHandler: { response in
            switch response.result {
            case .success(let value):
                self.productList = value
            case .failure(let error):
                print("Error: \(error)")
            }
        })
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.filteredProductList[indexPath.row].name
        cell.detailTextLabel?.text = "\(self.filteredProductList[indexPath.row].price)"

        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredProductList = !searchText.isEmpty ?
                                    productList.filter({$0.name.lowercased().contains(searchText.lowercased())}) :
                                    productList
        
        track(.search(query: searchText))
        
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        productCellAnimation(cell: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDescription" {
            guard
                let productDescriptionController = segue.destination as? ProductDescriptionViewController,
                let rowNumber = tableView.indexPathForSelectedRow?.row else {
                    return
            }
            track(.viewProduct(productName: filteredProductList[rowNumber].name))
            productDescriptionController.product = filteredProductList[rowNumber]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "productDescription", sender: indexPath)
    }
}
