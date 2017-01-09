//
//  ViewController.swift
//  Functional
//
//  Created by KingCQ on 2017/1/9.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let credential =  Credential(username: "bob", password: "wcq")
        login(credential) { result in
            switch result {
            case .success(let token):
            print(token, "hello")
            case .failure(let error):
            print(error, "fail")
            }
        }
        var array = Array(repeating: 1, count: 10)
        array[0] = 1
        array[1] = 2
        print(array, "🌹")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

func login(_ credential: Credential, completion: (Result<Token>) -> Void) {
    let error = Result<Token>.failure(Error(message: ""))
    let success = Result<Token>.success(Token(token: ""))
    completion(error)
    completion(success)
}

struct Token {
    var token: String?
}

struct Error {
    var message: String?
}

struct Credential {
    var username: String
    var password: String
}

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

