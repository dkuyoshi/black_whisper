//
//  TimeViewController.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/06.
//

import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet var endButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    //指定した時間(仮) 分
    let userTimer:Int = 3
    var count = 0

    var timeLabel: UILabel!
    var secondLabel: UILabel!
    var splitTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.timeLabel = UILabel()
        self.timeLabel.frame = CGRect(x:120,y:300,width:100,height:100)
        self.timeLabel.font = UIFont.systemFont(ofSize: 50)
        self.timeLabel.textAlignment = .center
        self.timeLabel.textColor = .white
        self.view.addSubview(timeLabel)
        
        // 区切り
        self.splitTime = UILabel()
        self.splitTime.frame = CGRect(x:150,y:300,width:100,height:100)
        self.splitTime.font = UIFont.systemFont(ofSize: 50)
        self.splitTime.textAlignment = .center
        self.splitTime.textColor = .white
        self.splitTime.text = ":"
        self.view.addSubview(splitTime)
        
        //秒
        self.secondLabel = UILabel()
        self.secondLabel.frame = CGRect(x:210,y:300,width:100,height:100)
        self.secondLabel.font = UIFont.systemFont(ofSize: 50)
        self.secondLabel.textColor = .white
        self.view.addSubview(secondLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //画面が表示されたらタイマーを動かす
        createTimer()
    }
    
    //タイマーの作成
    func createTimer(){
        count = userTimer * 60

        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(self.timerAction(sender:)),
                                         userInfo: nil,
                                         repeats: true)
        timer.fire()
    }
    
    //タイマーの処理
    @objc func timerAction(sender:Timer){
        let minuteCount = count / 60

        self.timeLabel.text = String(minuteCount)
        self.secondLabel.text = String(count - minuteCount*60)
        if count == 0{
            sender.invalidate() //止める
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "postView") as! PostViewController
            nextViewController.modalTransitionStyle = .crossDissolve
            self.present(nextViewController, animated: true, completion: nil)
        }
        count -= 1
    }
    
    @IBAction func endButton(_ sender: Any){
        count = 0
    }
    
    @IBAction func plusButton(_ sender: Any){
        count += 60
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
