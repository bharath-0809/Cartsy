//
//  Untitled.swift
//  Cartsy
//
//  Created by Bharathkumar on 31/05/25.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    var addToCartAction: (() -> Void)?

    @IBAction func addToCartTapped(_ sender: UIButton) {
        addToCartAction?()
    }
}
