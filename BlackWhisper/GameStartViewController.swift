//
//  GameStartViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/02.
//

import UIKit

class GameStartViewController: UIViewController {
    
    @IBOutlet var masterImg: UIImageView!
    @IBOutlet var labelEx: UILabel!
    
    @IBOutlet var userName1: UITextField!
    @IBOutlet var userName2: UITextField!
    @IBOutlet var userName3: UITextField!
    @IBOutlet var userName4: UITextField!
    
    @IBOutlet var startButton: UIButton!
    
    var name: String?
    var userNames: [String] = Array(repeating: "", count: 4)
    var userCheckFlag: [Int] = Array(repeating: 0, count: 4)
    
    let audio = JKAudioPlayer.sharedInstance()
    
    var csvArray: [String] = []
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                    target: self,
                                    selector: #selector(GameStartViewController.playBgm),
                                    userInfo: nil,
                                    repeats: false)
        
        self.startButton.isEnabled = false
        self.startButton.alpha = 0
        
        self.userName1.placeholder = "user name 1"
        self.userName2.placeholder = "user name 2"
        self.userName3.placeholder = "user name 3"
        self.userName4.placeholder = "user name 4"
    }
    
    @IBAction func editUsername(_ sender: UITextField) {
        self.name = sender.text
        if self.validate(){
            switch sender.tag {
            case 1:
                userNames[0] = self.name!
                userCheckFlag[0] = 1
            case 2:
                userNames[1] = self.name!
                userCheckFlag[1] = 1
            case 3:
                userNames[2] = self.name!
                userCheckFlag[2] = 1
            case 4:
                userNames[3] = self.name!
                userCheckFlag[3] = 1
            default:
                break
            }
        }
        else{
            switch sender.tag {
            case 1:
                userNames[0] = self.name!
                userCheckFlag[0] = 0
            case 2:
                userNames[1] = self.name!
                userCheckFlag[1] = 0
            case 3:
                userNames[2] = self.name!
                userCheckFlag[2] = 0
            case 4:
                userNames[3] = self.name!
                userCheckFlag[3] = 0
            default:
                break
            }
        }
        print(userNames)
        if self.fillUserNames(){
            //  スタートボタン有効
            self.startButton.isEnabled = true
            UIView.animate(withDuration: 1.0, delay: 0.8, options: [.curveEaseIn], animations: {
                self.startButton.alpha = 1.0
            }, completion: nil)
            self.audio.playSoundEffect(named: "laugh.mp3")
        }
        
    }
    
    @IBAction func kakuteiButton(_ sender: Any) {
            self.view.endEditing(true)
        }
    
    @IBAction func startButton(sender: UIButton){
        //　ミュージックストップ
        self.audio.stopMusic()
        //　アクセント
        self.audio.playSoundEffect(named: "hit.mp3")
    }
    
    @objc func playBgm(){
        //start back music(自作)
        self.audio.playMusic("talking.mp3")
    }
    
    private func validate() -> Bool {
        guard let aName = self.name else {
            return false
        }
        
        if aName.count == 0{
            return false
        }
        
        return true
    }
    
    private func fillUserNames() -> Bool {
        for check in self.userCheckFlag{
            if check == 0{
                return false
            }
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

