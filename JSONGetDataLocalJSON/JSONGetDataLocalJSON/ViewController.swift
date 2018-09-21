//
//  ViewController.swift
//  JSONGetDataLocalJSON
//
//  Created by macbookpro on 21.09.2018.
//  Copyright © 2018 Metin KARADUMAN. All rights reserved.
//

import UIKit

struct state: Decodable {
    
    let bolge : String?
    let id :Int?
    let il: String?
    let ilce: String?
    let plaka: Int?

    init(json : [String: Any]) {
        bolge = json["bolge"] as? String ?? ""
        id = json["id"] as? Int ?? -1
        il = json["il"] as? String ?? ""
        ilce = json["ilce"] as? String ?? ""
        plaka = json["plaka"] as? Int ?? -1
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            
            let url = Bundle.main.url(forResource: "il-ilce", withExtension: "json")
            let jsonData = try Data(contentsOf: url!)
            let states = try JSONDecoder().decode([state].self, from: jsonData)
            //All Data in states
            //Example1
            for singlestate in states {
                var city = singlestate.il
                print(city)
            }
            //EXAMPLE2
            print(states[0].ilce)
            
        } catch let err {
            print(err)
        }

    }

}

