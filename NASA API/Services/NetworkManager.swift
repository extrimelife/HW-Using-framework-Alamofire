//
//  NetworkManager.swift
//  NASA API
//
//  Created by roman Khilchenko on 22.09.2022.
//

import Foundation
import Alamofire


class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    
    func fenchDataUrl(from url: String?, completion: @escaping(Result<Nasa, AFError>) -> Void) {
        AF.request(Link.nasaURL.rawValue)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let nasasData = value as? [String: Any] else { return }
                    let nasa = Nasa(nasaData: nasasData)
                    completion(.success(nasa))
                case .failure(let error):
                    completion(.failure(error))
                }
                
            }
    }
    
    func fetchDataImg(from url: String?, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url ?? "")
            .responseData { response in
                switch response.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


enum Link: String {
    case nasaURL = "https://api.nasa.gov/planetary/apod?api_key=YigFXbdhor1XgRdVXZmOolHFEpXsrWSCqh0UpF6G"
    case imageUrl = "https://apod.nasa.gov/apod/image/2209/FairyPillar_Hubble_960.jpg"
    
}




