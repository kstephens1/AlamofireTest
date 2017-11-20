//
//  ViewController.swift
//  AlamoFireTest
//
//  Created by Keith Stephens on 18/10/2017.
//  Copyright © 2017 Keith Stephens. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//        }
        
//        Alamofire.request("https://httpbin.org/get").validate().responseJSON { response in
//            switch response.result {
//            case .success:
//                print("Validation Successful")
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        
        
    }

    @IBAction func btnTest(_ sender: Any) {
    
        //from https://stackoverflow.com/questions/26114831/how-to-parse-json-response-from-alamofire-api-in-swift
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/1").responseJSON { response in
            //debugPrint(response)
            
            if let json = response.data {
                let data = JSON(data: json)
                
                let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .long)
                
                self.txtView.text = ""
                self.txtView.text = timestamp
                self.txtView.text.append(data["title"].string!)
                self.txtView.text.append(data["body"].string!)
            
            }
        }
        
        
    }


    @IBAction func btnCharge(_ sender: Any) {

        Alamofire.request("https://www.services.renault-ze.com/api/user/login").responseJSON { response in
                debugPrint(response)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var txtView: UITextView!
    
}

