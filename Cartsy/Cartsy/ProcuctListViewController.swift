//
//  ProcuctListView.swift
//  Cartsy
//
//  Created by Bharathkumar on 31/05/25.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let products = [
        Product(id: 1, name: "Printed Hoodi", price: 99.99, imageName: "Printed Hoodi"),
        Product(id: 2, name: "Track pant", price: 59.99, imageName: "Track pant"),
        Product(id: 3, name: "Oversized shirt", price: 39.99, imageName: "Oversized shirt"),
        Product(id: 4, name: "Jeans", price: 69.99, imageName: "Jeans"),
        Product(id: 5, name: "Running shoes", price: 99.99, imageName: "Running shoes")
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    
        self.title = "Products"
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: "Cart",
                style: .plain,
                target: self,
                action: #selector(goToCart)
            )
        }
    @objc func goToCart() {
        performSegue(withIdentifier: "toCart", sender: self)
    }
   
    }

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        cell.nameLabel.text = product.name
        cell.priceLabel.text = "$\(product.price)"
        cell.productImageView.image = UIImage(named: product.imageName)
        cell.addToCartAction = {
            CartManager.shared.addToCart(product)
            let alert = UIAlertController(title: "Success", message: "\(product.name) added to cart!", preferredStyle: .alert)
            self.present(alert, animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alert.dismiss(animated: true)
            }
            print("Added to cart: \(product.name)")
        }
        return cell
    }
}
