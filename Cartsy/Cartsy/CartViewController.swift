//
//  CartViewController.swift
//  Cartsy
//
//  Created by Bharathkumar on 07/06/25.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    func updateTotal() {
        let total = CartManager.shared.totalAmount()
        totalLabel.text = "Total: ₹\(total)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
           updateTotal()
        }
    }
extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CartManager.shared.cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateTotal()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = CartManager.shared.cartItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell") ??
                   UITableViewCell(style: .subtitle, reuseIdentifier: "CartItemCell")

        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = "₹\(product.price)"

        return cell
    }
}

