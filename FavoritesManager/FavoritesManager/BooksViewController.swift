//
//  BooksViewController.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 06.12.2025.
//

import UIKit

struct BookItem {
    let title: String
    let image: UIImage
}

class BookViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let book: [BookItem] = [
        BookItem(title: "To Kill a Mockingbird", image: .b1),
        BookItem(title: "Pride and Prejudic", image: .b2),
        BookItem(title: "Qargyn", image: .b3),
        BookItem(title: "Gambler", image: .b4),
        BookItem(title: "Gaukhar tas", image: .b5),
//        BookItem(title: "Moonstruck", image: .b6),
//        BookItem(title: "Gabriella", image: .b7),
//        BookItem(title: "Miniskirt", image: .b8),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = book[indexPath.row]
        let bookCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        bookCell.label.text = book.title
        bookCell.iconImageView.image = book.image
        return bookCell
    }
    
    
}
    
extension BookViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.section) | \(indexPath.row)")
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


