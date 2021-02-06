//
//  PostViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/06.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet var onButton: UIButton!
    @IBOutlet var yourName: UILabel!
    @IBOutlet var centerButton: UIButton!
    @IBOutlet var underButton: UIButton!
    
    var myVar = GlobalVar.shared
    
    var count: Int = 0
    var selectUsersArray: [Int] = []
    
    var postTargetCount: [Int] = [0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        // default
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
        self.yourName.text = myVar.userNames[self.count]
        self.onButton.titleLabel?.text = myVar.userNames[self.selectUsersArray[0]]
        self.centerButton.titleLabel?.text = myVar.userNames[self.selectUsersArray[1]]
        self.underButton.titleLabel?.text = myVar.userNames[self.selectUsersArray[2]]
    }
    
    @IBAction func selectButton(_ sender: Any) {
        let button: UIButton = sender as! UIButton
        
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
        
        if self.count < 4{
            self.count += 1
            self.textChange()
        }
        else{
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "postView") as! PostViewController
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
