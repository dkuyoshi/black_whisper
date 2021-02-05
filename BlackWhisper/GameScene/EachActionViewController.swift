//
//  EachActionViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/05.
//

import UIKit

class EachActionViewController: UIViewController {
    
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var teamLabel: UILabel!
    @IBOutlet var text1: UILabel!
    @IBOutlet var text2: UILabel!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var centerButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    var userName: String = ""
    var csvArray: [String] = []
    var position: Int = -1
    
    var selectUsersArray: [Int] = []
    
    var myVar = GlobalVar.shared
    
    var getName: String = ""
    var getPosition: Int = -1
    
    // 殺人者に仲間がいるかどうかのチェック
    var teamFlag: Int = 0
    var killerPartnerName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.userLabel.text = userName
        self.positionLabel.text = myVar.posStringArray[self.position]
        self.checkButton.layer.cornerRadius = 10.0
        
        self.leftButton.isEnabled = false
        self.leftButton.isHidden = true
        self.leftButton.layer.cornerRadius = 15.0
        
        self.centerButton.isEnabled = false
        self.centerButton.isHidden = true
        self.centerButton.layer.cornerRadius = 15.0
        
        self.rightButton.isEnabled = false
        self.rightButton.isHidden = true
        self.rightButton.layer.cornerRadius = 15.0
        print(myVar.userNames)
        
        switch self.position {
        case 0:
            self.actionStudent()
        case 1:
            self.actionStudent()
        case 2:
            self.actionStudent()
        case 3:
            self.actionExcellent()
        case 4:
            self.actionKiller()
        case 5:
            self.actionKiller()
        case 6:
            self.actionPro()
        case 7:
            self.actionM()
        case 8:
            self.actionShadow()
        default:
            break
        }
    }
    
    
    private func userSelector(){
        switch myVar.count {
        case 0:
            self.selectUsersArray = [1, 2, 3]
        case 1:
            self.selectUsersArray = [0, 2, 3]
        case 2:
            self.selectUsersArray = [0, 1, 3]
        case 3:
            self.selectUsersArray = [0, 1, 2]
        default:
            print("COUNT ERROR")
            break
        }
        // print(myVar.userNames[self.selectUsersArray[0]])
    }
    
    @IBAction func selectButton(_ sender: Any) {
        let button: UIButton = sender as! UIButton
        
        switch button.tag {
        case 1:
            self.getName = myVar.userNames[self.selectUsersArray[0]]
            self.getPosition = myVar.positionArray[self.selectUsersArray[0]]
        case 2:
            self.getName = myVar.userNames[self.selectUsersArray[1]]
            self.getPosition = myVar.positionArray[self.selectUsersArray[1]]
        case 3:
            self.getName = myVar.userNames[self.selectUsersArray[2]]
            self.getPosition = myVar.positionArray[self.selectUsersArray[2]]
        default:
            print("TAG ERROR")
        }
        
        if self.position == 3{
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "excellentActionView") as! ExcellentActionViewController
            self.present(nextViewController, animated: true, completion: nil)
        }
        else{
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "shadowActionView") as! ShadowActionViewController
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func checkButtonAction(_ sender: Any){
        if (self.position == 4) || (self.position == 5){
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "killerActionView") as! KillerActionViewController
            nextViewController.partnerName = self.killerPartnerName
            nextViewController.partnerFlag = self.teamFlag
            self.present(nextViewController, animated: true, completion: nil)
        }
        else{
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "otherActionView") as! OtherActionViewController
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
    
    private func actionStudent(){
        self.teamLabel.text = "学生チーム"
        
        self.text1.text = myVar.text1Array[0]
        self.text2.text = myVar.text2Array[0]
    }
    
    private func actionExcellent(){
        self.userSelector()
        
        self.teamLabel.text = "学生チーム"
        
        self.text1.text = myVar.text1Array[3]
        self.text2.text = myVar.text2Array[3]
        
        self.checkButton.isEnabled = false
        self.checkButton.isHidden = true
        
        self.leftButton.isEnabled = true
        self.leftButton.isHidden = false
        self.leftButton.setTitle(myVar.userNames[self.selectUsersArray[0]], for: .normal)
        
        self.centerButton.isEnabled = true
        self.centerButton.isHidden = false
        self.centerButton.setTitle(myVar.userNames[self.selectUsersArray[1]], for: .normal)
        
        self.rightButton.isEnabled = true
        self.rightButton.isHidden = false
        self.rightButton.setTitle(myVar.userNames[self.selectUsersArray[2]], for: .normal)
    }
    
    private func actionKiller(){
        
        func killerTeamCheck() -> Int{
            var index: Int = 0
            for i in myVar.positionArray{
                if i != self.position{
                    if (i==4) || (i==5){
                        return index
                    }
                }
                index += 1
            }
            return -1
        }
        
        let teamCheckInt: Int = killerTeamCheck()
            
        if teamCheckInt < 0{
            self.teamFlag = 0
        }
        else{
            self.teamFlag = 1
            self.killerPartnerName = myVar.userNames[teamCheckInt]
        }
        
        self.teamLabel.text = "犯人チーム"
        self.teamLabel.backgroundColor = .red
        
        self.text1.text = myVar.text1Array[4]
        self.text2.text = myVar.text2Array[4]
        
        self.checkButton.titleLabel?.text = "仲間を確認"
    }
    
    private func actionPro(){
        self.teamLabel.text = "犯人チーム"
        self.teamLabel.backgroundColor = .red
        
        self.text1.text = myVar.text1Array[6]
        self.text2.text = myVar.text2Array[6]
        
        self.checkButton.titleLabel?.text = "わかりました"
    }
    
    private func actionM(){
        self.teamLabel.text = "特殊"
        self.teamLabel.backgroundColor = .gray
        
        self.text1.text = myVar.text1Array[7]
        self.text2.text = myVar.text2Array[7]
        
        self.checkButton.titleLabel?.text = "わかりました"
    }
    
    private func actionShadow(){
        self.userSelector()
        
        self.teamLabel.text = "特殊"
        self.teamLabel.backgroundColor = .gray
        
        self.text1.text = myVar.text1Array[8]
        self.text2.text = myVar.text2Array[8]
        
        self.checkButton.isEnabled = false
        self.checkButton.isHidden = true
        
        self.leftButton.isEnabled = true
        self.leftButton.isHidden = false
        self.leftButton.setTitle(myVar.userNames[self.selectUsersArray[0]], for: .normal)
        
        self.centerButton.isEnabled = true
        self.centerButton.isHidden = false
        self.centerButton.setTitle(myVar.userNames[self.selectUsersArray[1]], for: .normal)
        
        self.rightButton.isEnabled = true
        self.rightButton.isHidden = false
        self.rightButton.setTitle(myVar.userNames[self.selectUsersArray[2]], for: .normal)
        // self.rightButton.titleLabel?.text = myVar.userNames[self.selectUsersArray[2]]
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
