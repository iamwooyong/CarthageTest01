//
//  ViewController.swift
//  CarthageTest01
//
//  Created by NICE on 19/05/2019.
//  Copyright © 2019 NICE. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    @IBOutlet var id: UITextField!
    @IBOutlet var pw: UITextField!
    
    var resultCode: String?
    var resultMsg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func login(_ sender: UIButton) {

        let url = "http://192.168.123.104:3000/users/login"
        let param: Parameters = [
            "id": self.id.text!,
            "pw": self.pw.text!
        ]
        let alamo = Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.httpBody)
        
        print("id: \(id.text), pw: \(pw.text)")
        
        alamo.responseJSON() { response in
            print("RESULT JSON: \(response.result.value!)")

            if let jsonObject = response.result.value as? [String: Any] {
                print("result: \(jsonObject["result"]!)")
                

            }
        }
    }
}

