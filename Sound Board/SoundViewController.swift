//
//  SoundViewController.swift
//  Sound Board
//
//  Created by Ariel Nelson on 2/12/17.
//  Copyright © 2017 Ariel Nelson. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var audioRecorder : AVAudioRecorder?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpRecorder()
    }
    
    func setUpRecorder() {
        do {
        //Create AUDIO SESSION
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
        
        //Create URL for audio file
            let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let pathComponents = [basePath, "audio.m4a"]
            let audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
            print("*********************")
            print(audioURL)
        
        //Create setting for audio file
            var settings : [String:Any] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
            settings[AVSampleRateKey] = 44100.0
            settings[AVNumberOfChannelsKey] = 2
        
        //Create Audio Recorder Object
        
            audioRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
            audioRecorder!.prepareToRecord()
            
        } catch  let error as NSError{
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordTapped(_ sender: Any) {
        
        if audioRecorder!.isRecording {
            //Stop Recordng
            audioRecorder?.stop()
            
            //Chang button title to record
            recordButton.setTitle("Record", for: .normal)
            
        } else {
            //Start Recording
            audioRecorder?.record()
            
            //Change button title to stop
            recordButton.setTitle("Stop", for: .normal)
        
        }
        
    }
    
    @IBAction func playTapped(_ sender: Any) {
    
    }
    
    @IBAction func addTapped(_ sender: Any) {
    
    }
    

}
