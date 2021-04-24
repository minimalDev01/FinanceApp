//
//  OnBoardingStepsViewController.swift
//  FinanceApp
//
//  Created by Sergio Carralero Nuño on 24/4/21.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {
    // MARK: -@IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onBoardingImage: UIImageView!
    
    // MARK: -Properties
    var item: OnBoardingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        onBoardingImage.image = UIImage(named: item?.imageName ?? "")
    }
}
