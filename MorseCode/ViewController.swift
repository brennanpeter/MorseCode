//
//  ViewController.swift
//  MorseCode
//
//  Created by Peter Brennan on 1/16/18.
//  Copyright © 2018 Peter Brennan. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func flashlight(_ sender: UIButton) {
        if sender.titleLabel?.text == "ON" {
            sender.setTitle("OFF", for: .normal)
            toggleTorch(on: true)
        }
        else {
            sender.setTitle("ON", for: .normal)
            toggleTorch(on: false)
        }
    }
    
    // Using code from this stackoverflow question:
    // https://stackoverflow.com/questions/46945104/type-avcapturedevice-has-no-member-defaultdevice
    // and from Joshua Dance's stackoverflow answer:
    // https://stackoverflow.com/questions/27207278/how-to-turn-flashlight-on-and-off-in-swift/27334447
    
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video)
            else {return}
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    
    
}

