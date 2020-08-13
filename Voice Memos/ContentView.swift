//
//  ContentView.swift
//  Voice Memos
//
//  Created by Surya Chappidi on 11/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    var body: some View {
        NavigationView{
            VStack {
                
                RecordingsList(audioRecorder: audioRecorder)
                
                if audioRecorder.recording == false{
                    Button(action: {self.audioRecorder.startRecordding()}) {
                        Image(systemName: "circle.fill")
                        .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:100,height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom,40)
                    }
                }
                else {
                    Button(action: {self.audioRecorder.stopRecording()}) {
                        Image(systemName: "stop.fill")
                        .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:100,height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom,40)
                    }
                }
            }
        .navigationBarTitle("Voice Recorder")
        .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
