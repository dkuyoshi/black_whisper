//
//  RealActionViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/05.
//

import UIKit

class ShadowActionViewController: UIViewController {
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var yourLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var yourName: UILabel!
    
    var myVar = GlobalVar.shared
    
    var changePosIndex: Int = -1
    var changeUserIndex: Int = -1
    var myName: String = ""
    var changeUserName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.myLabel.text = myName
        self.yourLabel.text = myVar.posStringArray[changePosIndex]
        self.yourName.text = changeUserName
        print(myVar.positionArray)
        self.changePositionIndex()
    }
    
    func changePositionIndex(){
        print(changeUserIndex)
        let tmp = myVar.positionArray[myVar.count]
        myVar.positionArray[myVar.count] = myVar.positionArray[changeUserIndex]
        myVar.positionArray[changeUserIndex] = tmp
        print(myVar.positionArray)
    }
    
    @IBAction func nextButton(_ sender: Any){
        myVar.count += 1
        if myVar.count < 4{
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "checkView") as! CheckViewController
            nextViewController.modalTransitionStyle = .crossDissolve
            self.present(nextViewController, animated: true, completion: nil)
        }
        else{
            print("OKOK")
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
