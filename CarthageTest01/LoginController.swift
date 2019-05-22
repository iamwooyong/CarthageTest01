//
//  LoginController.swift
//  CarthageTest01
//
//  Created by NICE on 22/05/2019.
//  Copyright © 2019 NICE. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    
    @IBOutlet var lblLogin: UILabel!
    
    var resultCode: String?
    var resultMsg: String?
    
    override func viewDidLoad() {
 
        super.viewDidLoad()
        print("Login Controller resultCode ==> \(resultCode)")
        if(resultCode == "001"){
            lblLogin.text = "로그인 성공"
        } else {
            lblLogin.text = "로그인 실패 / 에러코드(\(String(describing: resultCode)):\(String(describing: resultMsg)))"
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
