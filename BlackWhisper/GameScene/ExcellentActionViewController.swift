//
//  ExcellentViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/05.
//

import UIKit

class ExcellentActionViewController: UIViewController {
    
    @IBOutlet var checkName: UILabel!
    @IBOutlet var posName: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var userCheck: String = ""
    var userPositionCheck: String = ""
    
    var myVar = GlobalVar.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.checkName.text = userCheck
        self.posName.text = userPositionCheck
        
    }
    
    @IBAction func nextButton(_ sender: Any){
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
