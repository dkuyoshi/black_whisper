//
//  FirstViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/03.
//

import UIKit

class CheckViewController: UIViewController {
    
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var userCheckText: UILabel!
    
    var userNames: [String] = Array(repeating: "", count: 4)
    var csvArray: [String] = []
    var positionArray: [Int] = []
    
    // 共通変数のあれこれ
    var myVar = GlobalVar.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
        
        self.userCheckText.text = myVar.userNames[myVar.count]
        self.checkButton.layer.cornerRadius = 10.0
        print(myVar.count)
        print(myVar.userNames)
    }
    
    @IBAction func pushCheckButton(sender: UIButton){
        myVar.count += 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tag: String = segue.identifier!
        switch tag {
        case "toEachAction":
            let nextView = segue.destination as! EachActionViewController
            nextView.userName = myVar.userNames[myVar.count]
            nextView.position = myVar.positionArray[myVar.count]
        default:
            print("ERROR <- I don't know why ???")
            break
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

}
