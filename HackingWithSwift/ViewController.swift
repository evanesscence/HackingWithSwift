//
//  ViewController.swift
//  HackingWithSwift
//
//  Created by Karina ❦ on 31.01.2024.
//

import UIKit

class ViewController: UITableViewController {
    
    struct Book {
        let title: String
        let image: String
        let quote: String
    }
    
    var books = [
        Book(title: "Гордость и предубеждение", image: "Гордость и предубеждение", quote: "Ещё никогда она не осознавала с такой отчётливостью, насколько сильно она могла бы его полюбить, как именно сейчас, в ту самую минуту, когда ни о какой любви между ними больше не могло быть и речи."),
        
        Book(title: "Джейн Эйр", image: "Джейн Эйр", quote: "Когда нас бьют без причины, мы должны отвечать ударом на удар, и притом с такой силой, чтобы навсегда отучить людей бить нас."),
        
        Book(title: "Цветы для Элджернона", image: "Цветы для Элджернона", quote: "Раньше меня презирали за невежество и тупость, теперь ненавидят за ум и знания. Господи, да чего же им нужно от меня?"),
        
        Book(title: "Заводной апельсин", image: "Заводной апельсин", quote: "Аминь. И всякий прочий kal."),
        
        Book(title: "Мартин Иден", image: "Мартин Иден", quote: "Ограниченные умы видят ограниченность только в других.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        books.sort(by: {$0.title < $1.title})
        
        title = "Книги"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        
        cell.textLabel?.text = books[indexPath.row].title
        cell.textLabel?.font = UIFont(name: "system", size: 22)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = books[indexPath.row].image
            vc.quote = books[indexPath.row].quote
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
}

