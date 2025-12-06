//
//  ViewController.swift
//  TableView
//
//  Created by Zhaniya Utemuratova on 22.11.2025.
//

import UIKit

let sections = [
    "Movies",
    "Music",
    "Books",
    "University Courses"
]

struct MovieItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
}
struct MusicItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
}
struct BookItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
}
struct UniversityCourseItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!

    let movies: [MovieItem] = [
        MovieItem(title: "Pride and prejudice", subtitle: "2005. Romance/Comedy", review: "Best period drama ever! I can rewatch it right after i have finished it.", image: .pandp),
        MovieItem(title: "The maze runner", subtitle: "2014‧ Sci-fi/Action", review: "I really enjoy films about zomby apocalypse. This one is the best, love all 3 parts!", image: .mazerunner),
        MovieItem(title: "The Notebook", subtitle: "2004‧ Romance/Comedy", review: "When i watched this film i started questioning myself do i really love anyone?", image: .notebook),
        MovieItem(title: "The Shawshank Redemption", subtitle: "1994‧ Thriller/Crime", review: "Watched this movie in September, and it is best film in IMBD for a reason. Recommend!", image: .escape),
        MovieItem(title: "F1", subtitle: "2025‧ Sport/Action", review: "Very inspiring to me! ALso i love the soundtrack 'lose my mind' by Hanz Zimmer. ", image: .f1),
    ]

    let music: [MusicItem] = [
        MusicItem(title: "Anlasana", subtitle: "Nahide Babashli", review: "One of popular turkish songs. Enjoyable!", image: ._1),
        MusicItem(title: "The Last Waltz", subtitle: "Cho Young-Wuk", review: "Soundtrack of Old Boy film is amazing!", image: ._2),
        MusicItem(title: "Criminal", subtitle: "Britney Spears", review: "Britney is one of the best singers ever!", image: ._3),
        MusicItem(title: "Medieval", subtitle: "FINNEAS", review: "Brother of Billie Eilish. Very talented!", image: ._4),
        MusicItem(title: "The Less I Know The Better", subtitle: "Tame Impala", review: "Inspirational song!", image: ._5),
    ]
    
    let book: [BookItem] = [
        BookItem(
            title: "To Kill a Mockingbird",
            subtitle: "Harper Lee • Classic Fiction",
            review: "A timeless story about justice, morality, and childhood innocence. Deep and emotional.",
            image: .b1
        ),
        BookItem(
            title: "Pride and Prejudice",
            subtitle: "Jane Austen • Romance/Drama",
            review: "A witty and charming romance. I loved the character development and elegance of the writing.",
            image: .b2
        ),
        BookItem(
            title: "Qargyn",
            subtitle: "Kazakh Contemporary Novel",
            review: "A powerful and emotional story exploring identity and inner strength. Very impactful.",
            image: .b3
        ),
        BookItem(
            title: "Gambler",
            subtitle: "Fyodor Dostoevsky • Psychological Drama",
            review: "A powerful novel about addiction, obsession, and the complexity of human emotions.",
            image: .b4
        ),

        BookItem(
            title: "Gaukar tas",
            subtitle: "Dulat Isabekov • story",
            review: "A modern, emotional story about love and self-discovery. Very relatable and aesthetic.",
            image: .b5
        )
    ]

    
    let universityCourse: [UniversityCourseItem] = [
        UniversityCourseItem(
            title: "iOS Development",
            subtitle: "Xcode • Swift • UIKit",
            review: "My absolute favorite course! 10/10. I want to become an iOS developer in the future!",
            image: .u1
        ),
        UniversityCourseItem(
            title: "Calculus",
            subtitle: "Limits • Integrals • Derivatives",
            review: "Challenging but very rewarding. Helps build strong logical and analytical skills.",
            image: .u2
        ),
        UniversityCourseItem(
            title: "Theatre Acting",
            subtitle: "Stage Presence • Improvisation",
            review: "Very fun and creative! Helps with confidence, emotions, and communication skills.",
            image: .u3
        ),
        UniversityCourseItem(
            title: "Algorithms and Data Structures",
            subtitle: "Graphs • Sorting • Dynamic Programming",
            review: "Hardest but most important CS course. Great for interviews and problem-solving.",
            image: .u4
        ),
        UniversityCourseItem(
            title: "History of Kazakhstan",
            subtitle: "Ancient to Modern Periods",
            review: "Interesting course that helps understand culture, national identity, and historical events.",
            image: .u5
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return movies.count
        case 1: return music.count
        case 2: return book.count
        case 3: return universityCourse.count
        default: return 0
        }
    }

    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! TableViewCell

        switch indexPath.section {
        case 0:
            let item = movies[indexPath.row]
            cell.titleLabel.text = item.title
            cell.subtitleLabel.text = item.subtitle
            cell.reviewLabel.text = item.review
            cell.iconImageView.image = item.image

        case 1:
            let item = music[indexPath.row]
            cell.titleLabel.text = item.title
            cell.subtitleLabel.text = item.subtitle
            cell.reviewLabel.text = item.review
            cell.iconImageView.image = item.image
            
        case 2:
            let item = book[indexPath.row]
            cell.titleLabel.text = item.title
            cell.subtitleLabel.text = item.subtitle
            cell.reviewLabel.text = item.review
            cell.iconImageView.image = item.image
            
        case 3:
            let item = universityCourse[indexPath.row]
            cell.titleLabel.text = item.title
            cell.subtitleLabel.text = item.subtitle
            cell.reviewLabel.text = item.review
            cell.iconImageView.image = item.image

        default:
            
            cell.titleLabel.text = "No Data"
            cell.subtitleLabel.text = ""
            cell.reviewLabel.text = ""
            cell.iconImageView.image = nil
        }

        return cell
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.section) | \(indexPath.row)")
    }
}
