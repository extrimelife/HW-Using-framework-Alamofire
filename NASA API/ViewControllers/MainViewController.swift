//
//  ViewController.swift
//  NASA API
//
//  Created by roman Khilchenko on 15.09.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    //MARK: - Переопределенные методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupActivitiIndicator()
        
    }
    
    //MARK: - IBActions
    
    @IBAction func actionButton(_ sender: UIButton) {
        if sender.currentTitle == "Show Info" {
            sender.setTitle("Hide Info", for: .normal)
            explanationLabel.isHidden = false
        } else {
            sender.setTitle("Show Info", for: .normal)
            explanationLabel.isHidden = true
        }
    }
    
    
    //MARK: - Private methods
    
    private func fetchData() {
        NetworkManager.shared.fenchDataUrl(from: Link.nasaURL.rawValue) { result in
            switch result {
            case .success(let nasa):
                self.explanationLabel.text = nasa.explanation
                self.dateLabel.text = nasa.date
                self.fetchImage(url: nasa.url)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    private func fetchImage(url: String?) {
        NetworkManager.shared.fetchDataImg(from: url ?? "") { result in
            switch result {
            case .success(let imageData):
                self.imageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    private func setupActivitiIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
}



