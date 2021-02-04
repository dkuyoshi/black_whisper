//
//  FirstViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/03.
//

import UIKit

class FirstViewController: UIViewController {
    
    var userNames: [String] = Array(repeating: "", count: 4)
    var csvArray: [String] = []
    var positionArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print(userNames)
        print(csvArray)
        print(positionArray)
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
