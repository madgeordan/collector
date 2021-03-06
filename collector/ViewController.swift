//
//  ViewController.swift
//  collector
//
//  Created by George Lushch on 6/15/17.
//  Copyright © 2017 madgeordan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var collections: [Collection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            collections = try context.fetch(Collection.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let collection = collections[indexPath.row]
        cell.textLabel?.text = collection.name
        cell.imageView?.image = UIImage(data: collection.picture! as Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collection = collections[indexPath.row]
        performSegue(withIdentifier: "plusSegue", sender: collection)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateVC
        nextVC.collection = sender as? Collection
    }
}



