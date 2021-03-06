//
//  StratViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/02.
//

import UIKit
import AVFoundation

class StratViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var exploration: UITextView!
    @IBOutlet weak var gameStart: UIButton!
    @IBOutlet weak var positionCheck: UIButton!
    
    let audio = JKAudioPlayer.sharedInstance()
    
    var csvArray: [String] = []
    
    var myVar = GlobalVar.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
        
        self.view.addBackground(name: "back_title.jpg")
        csvArray = loadCSV(fileName: "position")
        myVar.csvArray = csvArray
        
        self.gameStart.alpha = 0.0
        UIView.animate(withDuration: 2.0, delay: 1.0, options: [.curveEaseIn], animations: {
            self.gameStart.alpha = 1.0
        }, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == "toPos" {
                let nextView = segue.destination as! PositionViewController
                nextView.csvArray = csvArray
            }
        
            if segue.identifier == "toGameStart" {
                let nextView = segue.destination as! GameStartViewController
                nextView.csvArray = csvArray
            }
        
        }
    
    @IBAction func btnAction(sender: UIButton){
        self.audio.playSoundEffect(named: "hit.mp3")
    }
    
    @IBAction func posBtnAction(sender: UIButton){
        // print(sender.tag)
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        // titleに戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadCSV(fileName: String) -> [String]{
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do{
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch{
            print("File Reading Error!")
        }
        return csvArray
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

