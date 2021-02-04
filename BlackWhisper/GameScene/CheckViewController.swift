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
    
    // この画面が何回きたかのカウント
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print(userNames)
        print(csvArray)
        print(positionArray)
        
        self.userCheckText.text = userNames[count]
        self.checkButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func pushCheckButton(sender: UIButton){
        let position = self.positionArray[count]
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tag: String = segue.identifier!
        switch tag {
        case "toStudent":
            let nextView = segue.destination as! StudentViewController
            nextView.userName = self.userNames[count]
            nextView.csvArray = self.csvArray
            nextView.position = self.positionArray[count]
        case "toExcellent":
            let nextView = segue.destination as! ExcellentStudentViewController
            nextView.userName = self.userNames[count]
            nextView.csvArray = self.csvArray
            nextView.position = self.positionArray[count]
        case "toKiller":
            let nextView = segue.destination as! KillerViewController
            nextView.userName = self.userNames[count]
            nextView.csvArray = self.csvArray
            nextView.position = self.positionArray[count]
        case "toPro":
            let nextView = segue.destination as! ProffesionalViewController
            nextView.userName = self.userNames[count]
            nextView.csvArray = self.csvArray
            nextView.position = self.positionArray[count]
        case "toM":
            let nextView = segue.destination as! MViewController
            nextView.userName = self.userNames[count]
            nextView.csvArray = self.csvArray
            nextView.position = self.positionArray[count]
        case "toShadow":
            let nextView = segue.destination as! ShadowViewController
            nextView.userName = self.userNames[count]
            nextView.csvArray = self.csvArray
            nextView.position = self.positionArray[count]
        default:
            print("ERROR <- I don't know why ???")
            break
        }
        
        count += 1
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
