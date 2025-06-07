//
//  CartManager.swift
//  Cartsy
//
//  Created by Bharathkumar on 07/06/25.
//

class CartManager {
    static let shared = CartManager()
    
    private init() {}
    
    var cartItems: [Product] = []
    
    func addToCart(_ product: Product) {
        cartItems.append(product)
    }
    
    func totalAmount() -> Double {
        return cartItems.reduce(0) { $0 + $1.price }
    }
}
