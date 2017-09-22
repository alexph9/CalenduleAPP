//
//  HorarioViewController.swift
//  Calendule
//
//  Created by Ivan on 22/9/17.
//  Copyright © 2017 Talentum. All rights reserved.
//

import UIKit

class HorarioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contenido: UILabel!
    @IBOutlet weak var hora: UILabel!
    
}

class HorarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! HorarioTableViewCell
        
        cell.hora?.text = "\(indexPath.row):00"
        cell.contenido?.text = "Descripción \(indexPath.row)"
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
