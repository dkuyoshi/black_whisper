//
//  ResultViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/06.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var deathName: UILabel!
    @IBOutlet var teamLabel: UILabel!
    @IBOutlet var isDEAD: UILabel!
    @IBOutlet var isWON: UILabel!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var titleButton: UIButton!
    
    var myVar = GlobalVar.shared
    var postTargetCount: [Int] = []
    var judgeIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.judgeIndex = self.deathJudge()
        
        self.deathName.text = myVar.userNames[judgeIndex]
        self.teamLabel.isHidden = true
        self.isWON.isHidden = true
        self.titleButton.isHidden = true
        self.titleButton.isEnabled = false
    }
    
    private func deathJudge() -> Int{
        let judgeIndex: Int = self.postTargetCount.firstIndex(of: postTargetCount.max()!)!
        return judgeIndex
    }
    
    private func isM(index: Int) -> Bool{
        return myVar.positionArray[index] == 7
    }
    
    private func getDeathTeam(){
        if self.isM(index: self.judgeIndex){
            self.teamLabel.text = myVar.posStringArray[self.judgeIndex]
        }
        else{
            if self.wonKiller(){
                self.teamLabel.text = "犯人チーム"
            }
            else{
                self.teamLabel.text = "学生チーム"
            }
        }
        self.teamLabel.isHidden = false
        self.isWON.isHidden = false
        
    }
    
    private func wonKiller() -> Bool{
        for index in myVar.positionArray{
            if index != self.judgeIndex{
                switch index {
                case 4:
                    return true
                case 5:
                    return true
                default:
                    break
                }
            }
        }
        return false
    }
    
    @IBAction func okButton(_ sender: Any){
        self.okButton.isHidden = true
        self.okButton.isEnabled = true
        self.getDeathTeam()
        self.titleButton.isHidden = false
        self.titleButton.isEnabled = true
    }
    
    @IBAction func titleButton(_ sender: Any){
        print("COMPLETE")
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
