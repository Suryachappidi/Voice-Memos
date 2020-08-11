//
//  AudioRecorder.swift
//  Voice Memos
//
//  Created by Surya Chappidi on 11/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioRecorder:  ObservableObject{
    
    let objectWillChange = PassthroughSubject<AudioRecorder,Never>()
    
    var audioRecorder: AVAudioRecorder!
    
    var recording = false{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    func startRecordding(){
        let recordingSession = AVAudioSession.sharedInstance()
        
        do{
            try recordingSession.setCategory(.playAndRecord,mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to setup recording Session")
        }
        
        //File Name
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat:"dd-MM-YY_'at'_HH:mm:ss")).m4a")
        
        // Audio Settings
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey:1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do{
            audioRecorder = try AVAudioRecorder(url: audioFilename,settings: settings)
            audioRecorder.record()
            
            recording = true
        }
        catch{
            print("Could not start recording")
        }
        
    }
    
    func stopRecording(){
        audioRecorder.stop()
        recording = false
    }
}
