//
//  MoviesViewController.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 06.12.2025.
//

import UIKit

struct MovieItem {
    let title: String
    let image: UIImage
}

class MoviesViewController: UIViewController {

    @IBOutlet weak var table: UITableView!

    let movies: [MovieItem] = [
        MovieItem(title: "Pride and prejudice", image: .pandp),
        MovieItem(title: "The maze runner", image: .mazerunner),
        MovieItem(title: "The Notebook", image: .notebook),
        MovieItem(title: "The Shawshank Redemption", image: .escape),
        MovieItem(title: "F1", image: .f1),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.imageView?.image = movie.image
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
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


