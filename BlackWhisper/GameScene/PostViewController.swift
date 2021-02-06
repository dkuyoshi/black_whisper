//
//  PostViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/06.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet var yourName: UILabel!

    @IBOutlet var onButton: UIButton!
    @IBOutlet var centerButton: UIButton!
    @IBOutlet var underBUtton: UIButton!
    
    var myVar = GlobalVar.shared
    
    var count: Int = 0
    var selectUsersArray: [Int] = []
    var postTargetCount: [Int] = [0, 0, 0, 0]
    
    let audio = JKAudioPlayer.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        // default
        print(myVar.userNames)
        self.textChange()
    }
    
    private func userSelector(){
        switch self.count {
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
    
    private func textChange(){
        self.userSelector()
        print(self.count)
        print(self.selectUsersArray)
        self.yourName.text = myVar.userNames[self.count]
        self.onButton.setTitle(myVar.userNames[self.selectUsersArray[0]], for: .normal)
        self.centerButton.setTitle(myVar.userNames[self.selectUsersArray[1]], for: .normal)
        self.underBUtton.setTitle(myVar.userNames[self.selectUsersArray[2]], for: .normal)
    }
    
    @IBAction func selectButton(_ sender: Any) {
        let button: UIButton = sender as! UIButton
        // アクセント
        self.audio.playSoundEffect(named: "hit.mp3")
        
        switch button.tag {
        case 1:
            self.postTargetCount[self.selectUsersArray[0]] += 1
        case 2:
            self.postTargetCount[self.selectUsersArray[1]] += 1
        case 3:
            self.postTargetCount[self.selectUsersArray[2]] += 1
        default:
            print("TAG ERROR")
        }
        
        self.count += 1
        if self.count < 4{
            self.textChange()
        }
        else{
            print(self.postTargetCount)
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
            nextViewController.modalTransitionStyle = .crossDissolve
            self.present(nextViewController, animated: true, completion: nil)
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
