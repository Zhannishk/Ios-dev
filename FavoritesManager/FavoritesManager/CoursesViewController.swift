//
//  ViewController.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 06.12.2025.
//

import UIKit

struct CourseItem {
    let title: String
    let image: UIImage
}

class CoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let course: [CourseItem] = [
        CourseItem(title: "Ios dev", image: .c1),
        CourseItem(title: "Alogithm and data structures", image: .c2),
        CourseItem(title: "Calculus", image: .c3),
        CourseItem(title: "Physics", image: .c4),
        CourseItem(title: "History", image: .c5),
        CourseItem(title: "Linear algebra", image: .c6),
        CourseItem(title: "Discrete math", image: .c7),
        CourseItem(title: "Machine learning", image: .c8),
        CourseItem(title: "Statistics", image: .c9),
        CourseItem(title: "Web development", image: .c10),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = course[indexPath.row]
        let courseCell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseTableViewCell
        courseCell.label.text = course.title
        courseCell.iconImageView.image = course.image
        return courseCell
    }
}

extension CoursesViewController {
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


