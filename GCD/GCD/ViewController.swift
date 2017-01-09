//
//  ViewController.swift
//  GCD
//
//  Created by KingCQ on 2017/1/9.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.async {
            print(Thread.current, "\(Thread.isMainThread)", "🌹")
        }
        
        DispatchQueue.init(label: "no").async {
            print(Thread.current, "\(Thread.isMainThread)noa", "🌹")
        }
        
        DispatchQueue.init(label: "no").sync {
            print(Thread.current, "\(Thread.isMainThread)no", "🌹")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

