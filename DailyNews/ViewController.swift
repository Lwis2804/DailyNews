//
//  ViewController.swift
//  DailyNews
//
//  Created by LUIS GONZALEZ on 17/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tablaNoticias: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaNoticias.dataSource = self
        tablaNoticias.delegate = self
    }


}



extension ViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablaNoticias.dequeueReusableCell(withIdentifier: "celdaNoticia", for: indexPath)
        cell.textLabel?.text = "Articulo 1 "
        return cell
    }
    
    
}
