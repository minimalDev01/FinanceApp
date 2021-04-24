//
//  OnBoardingContainerViewController.swift
//  FinanceApp
//
//  Created by Sergio Carralero Nuño on 24/4/21.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {
    // MARK: -IBOutlets
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "openOnBoarding", let destination = segue.destination as? OnBoardingViewController else {
            return
        }
        
        destination.pageControl = pageControl
    }
}
