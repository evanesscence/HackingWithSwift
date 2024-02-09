//
//  ViewController.swift
//  HackingWithSwift
//
//  Created by Karina ❦ on 31.01.2024.
//

import UIKit

class ViewController: UITableViewController {
    
    let books = ["Гордость и предубеждение", "Джейн Эйр", "Цветы для Элджернона", "Заводной апельсин", "Мартин Иден"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = books[indexPath.row]
        cell.imageView?.image = UIImage(named: books[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}

