//
//  NasaModel.swift
//  NASA API
//
//  Created by roman Khilchenko on 15.09.2022.
//

import Foundation

struct Nasa: Decodable {
    
    let date: String?
    let explanation: String?
    let hdurl: String?
    let url: String?

    
    init(nasaData: [String: Any]) {
        date = nasaData["date"] as? String
        explanation = nasaData["explanation"] as? String
        hdurl = nasaData["hdurl"] as? String
        url = nasaData["url"] as? String
        
    }
    
}


        



