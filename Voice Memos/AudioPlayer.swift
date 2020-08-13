//
//  AudioPlayer.swift
//  Voice Memos
//
//  Created by Surya Chappidi on 13/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioPlayer:NSObject, ObservableObject , AVAudioPlayerDelegate {
    let objectWillChange = PassthroughSubject<AudioPlayer, Never>()
    
    var audioPlayer: AVAudioPlayer!
    
    var isPlaying = false{
        didSet{
            objectWillChange.send(self)
        }
    }
    func startPlayback(audio: URL){
        let playbackSession = AVAudioSession.sharedInstance()
        
        do{
            try playbackSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        }
        catch {
            print("Playing over speaker failed")
        }
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer.delegate = self
            audioPlayer.play()
            isPlaying = true
        }
        catch{
            print("Playback Failed")
        }
    }
    
    func stopPlayback(){
        audioPlayer.stop()
        isPlaying = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag{
            isPlaying = false
        }
    }
    
}
