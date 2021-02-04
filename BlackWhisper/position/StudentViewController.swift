//
//  StudentViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/04.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    
    var userName: String = ""
    var csvArray: [String] = []
    var position: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.checkButton.layer.cornerRadius = 10.0
        userLabel.text = userName
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
