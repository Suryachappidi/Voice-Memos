//
//  RecordingsList.swift
//  Voice Memos
//
//  Created by Surya Chappidi on 11/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct RecordingsList: View {
    @ObservedObject var audioRecorder: AudioRecorder
    var body: some View {
        List {
            Text("Empty List!!")
        }
    }
}

struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsList(audioRecorder: AudioRecorder())
    }
}
