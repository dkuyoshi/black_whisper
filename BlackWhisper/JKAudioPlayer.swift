//
//  audioPlayer.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/02.
//

import Foundation
import AVFoundation

private let JKAudioInstance = JKAudioPlayer()

open class JKAudioPlayer {
    var musicPlayer: AVAudioPlayer!
    var soundPlayer: AVAudioPlayer!
    static var canShareAudio = false {
        didSet {
            canShareAudio ? try! AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
                : try! AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.soloAmbient)
        }
    }
    
    open class func sharedInstance() -> JKAudioPlayer {
        return JKAudioInstance
    }
    
    open func playMusic(_ fileName: String, withExtension type: String = "") {
        if let url = Bundle.main.url(forResource: fileName, withExtension: type) {
            musicPlayer = try? AVAudioPlayer(contentsOf: url)
            musicPlayer.numberOfLoops = -1
            musicPlayer.prepareToPlay()
            musicPlayer.play()
        }
    }
    
    open func stopMusic() {
        if musicPlayer != nil && musicPlayer!.isPlaying {
            musicPlayer.currentTime = 0
            musicPlayer.stop()
        }
    }
    
    open func pauseMusic() {
        if musicPlayer != nil && musicPlayer!.isPlaying {
            musicPlayer.pause()
        }
    }
    
    open func resumeMusic() {
        if musicPlayer != nil && !musicPlayer!.isPlaying {
            musicPlayer.play()
        }
    }
    
    open func playSoundEffect(named fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "") {
            soundPlayer = try? AVAudioPlayer(contentsOf: url)
            soundPlayer.stop()
            soundPlayer.numberOfLoops = 0
            soundPlayer.prepareToPlay()
            soundPlayer.play()
        }
    }
}
