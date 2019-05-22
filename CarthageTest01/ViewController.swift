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

        let url = "http://192.168.0.180:3000/users/login"
        let param: Parameters = [
            "id": self.id.text!,
            "pw": self.pw.text!
        ]
        print("id: \(String(describing: id.text)), pw: \(String(describing: pw.text))")

        let alamo = Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.httpBody)
        
        alamo.responseJSON() { response in
            
            if let json = response.result.value as? [String: Any] {
                print("JSON: \(json)") // serialized json response
 
                guard let result = json["result"] as? [String: Any],
                let code = result["resultCode"] as? String,
                let msg = result["resultMsg"] as? String else {
                    
                    print("Failed to parse JSON")
                    return
                }
                self.resultCode = code
                self.resultMsg = msg
            }

            print("ViewController resultCode ==> \(String(describing: self.resultCode))")
            guard let destination = self.storyboard?.instantiateViewController(withIdentifier: "LoginController") as? LoginController else { return }
            destination.resultCode = self.resultCode
            destination.resultMsg = self.resultMsg
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
}

