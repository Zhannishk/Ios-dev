//
//  main.swift
//  Lab3
//
//  Created by Zhaniya Utemuratova on 10.10.2025.
//

import Foundation

//Part 1: Product Models (35 points)
//1.1 Product Struct

struct Product  {
    var id: String
    var name: String
    var price: Double
    var category: Category
    var description: String
    

    enum Category: String, CaseIterable {
        case electronics
        case clothing
        case food
        case books
    }
    
    var displayPrice: String {
        String(format: "$%.2f", price)
    }
    
    init(id: String, name: String, price: Double, category: Category, description: String) {
        guard price >= 0 else {
            fatalError("Price must be non-negative")
        }
        self.id = id
        self.name = name
        self.price = price
        self.description = description
        self.category = category
    }
}
    
    
// 1.2 CartItem Struct
    
struct cartItem {
    var product: Product
    var quantity: Int
    
    var subtotal: Double {
        product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else {
            print("Quantity must me greater than 0")
            return
        }
        quantity = newQuantity
        print("Quantity updated")
    }
    
    mutating func increaseQuantity(_ amount: Int) {
        quantity += amount
    }
    
    
}

// Part 2: Shopping Cart Class (35 points)


class ShoppingCart {
    private(set) var items: [cartItem]
    var discountCode: String?
    
    init() {
        self.items = []
    }
    
    func addItem(product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: {$0.product.id == product.id}){
            items[index].increaseQuantity(quantity)
            print("\(product.name) quantity increased to \(items[index].quantity)")
        }
        else{
            let newItem = cartItem(product: product, quantity: quantity)
            items.append(newItem)
            print("\(newItem) added to cart")
        }
    }
    
    func removeItem(productId: String) {
        guard let index = items.firstIndex(
            where: {$0.product.id == productId})
        else {
            print("Item not found")
            return
        }
        items.remove(at: index)
        print("Item removed")
    }

    func updateItemQuantity(productId: String, quantity: Int) {
        
    }
    
    
}
