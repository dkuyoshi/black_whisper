//
//  KillerActionViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/05.
//

import UIKit

class KillerActionViewController: UIViewController {
    @IBOutlet var teanLabel: UILabel!
    @IBOutlet var partnerLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var partnerName: String = ""
    var partnerFlag: Int = 0
    
    var myVar = GlobalVar.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nextButton.layer.cornerRadius = 10.0
        
        if self.partnerFlag==0{
            self.partnerLabel.isHidden = true
        }
        else{
            self.teanLabel.text = "Your partner is ..."
            self.partnerLabel.text = self.partnerName
        }
    }
    
    @IBAction func nextButton(_ sender: Any){
        myVar.count += 1
        if myVar.count < 4{
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "checkView") as! CheckViewController
            nextViewController.modalTransitionStyle = .crossDissolve
            self.present(nextViewController, animated: true, completion: nil)
        }
        else{
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "timeView") as! TimeViewController
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
