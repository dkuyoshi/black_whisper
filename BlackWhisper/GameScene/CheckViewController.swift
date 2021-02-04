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
        self.userCheckText.text = myVar.userNames[myVar.count]
        self.checkButton.layer.cornerRadius = 10.0
        print(myVar.count)
        print(myVar.userNames)
    }
    
    @IBAction func pushCheckButton(sender: UIButton){
        let position = myVar.positionArray[myVar.count]
        switch position {
        case 0:
            self.performSegue(withIdentifier: "toStudent", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "toStudent", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "toStudent", sender: nil)
        case 3:
            self.performSegue(withIdentifier: "toExcellent", sender: nil)
        case 4:
            self.performSegue(withIdentifier: "toKiller", sender: nil)
        case 5:
            self.performSegue(withIdentifier: "toKiller", sender: nil)
        case 6:
            self.performSegue(withIdentifier: "toPro", sender: nil)
        case 7:
            self.performSegue(withIdentifier: "toM", sender: nil)
        case 8:
            self.performSegue(withIdentifier: "toShadow", sender: nil)
        default:
            break
        }
        myVar.count += 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tag: String = segue.identifier!
        switch tag {
        case "toStudent":
            let nextView = segue.destination as! StudentViewController
            nextView.userName = myVar.userNames[myVar.count]
            nextView.csvArray = self.csvArray
            nextView.position = myVar.positionArray[myVar.count]
        case "toExcellent":
            let nextView = segue.destination as! ExcellentStudentViewController
            nextView.userName = myVar.userNames[myVar.count]
            nextView.csvArray = self.csvArray
            nextView.position = myVar.positionArray[myVar.count]
        case "toKiller":
            let nextView = segue.destination as! KillerViewController
            nextView.userName = myVar.userNames[myVar.count]
            nextView.csvArray = self.csvArray
            nextView.position = myVar.positionArray[myVar.count]
        case "toPro":
            let nextView = segue.destination as! ProffesionalViewController
            nextView.userName = myVar.userNames[myVar.count]
            nextView.csvArray = self.csvArray
            nextView.position = myVar.positionArray[myVar.count]
        case "toM":
            let nextView = segue.destination as! MViewController
            nextView.userName = myVar.userNames[myVar.count]
            nextView.csvArray = self.csvArray
            nextView.position = myVar.positionArray[myVar.count]
        case "toShadow":
            let nextView = segue.destination as! ShadowViewController
            nextView.userName = myVar.userNames[myVar.count]
            nextView.csvArray = self.csvArray
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
