import UIKit

class ProductDescriptionViewController: UIViewController, Animations, TrackableMixin {

    @IBOutlet var customView: ProductDescriptionView!
    
    var product: Product!
    
    @IBAction func addToBasket(_ sender: UIButton) {
        buttonAnimation(button: sender)
        track(.addToBasket(price: product.price, productName: product.name))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.productName.text = product.name
        customView.price.text = "\(product.price)"
    }
}
