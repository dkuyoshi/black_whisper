//
//  ViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleChara: UIImageView!
    
    let audio = JKAudioPlayer.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
        
        titleChara.alpha = 0.0
        UIView.animate(withDuration: 1.0, delay: 1.0, options: [.curveEaseIn], animations: {
            self.titleChara.alpha = 1.0
        }, completion: nil)
        
        //start back music(自作)
        self.audio.playMusic("talking.mp3")
    }

}

