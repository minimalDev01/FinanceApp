//
//  OnBoardingViewController.swift
//  FinanceApp
//
//  Created by Sergio Carralero Nuño on 24/4/21.
//

import UIKit

struct OnBoardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIPageViewController {
    // MARK: -Properties
    var pageControl: UIPageControl?
    fileprivate(set) lazy var items: [OnBoardingItem] = {
        return [
            OnBoardingItem(title: "Save money and reduce debit", description: "Press the Start button", imageName: "OnBoarding1"),
            OnBoardingItem(title: "You finished your onboarding", description: "Press the Start button", imageName: "OnBoarding2")
        ]
    }()
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        var items = [UIViewController]()
        for i in 0 ..< self.items.count {
            items.append(self.instanceViewController(i))
        }
        
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        pageControl?.numberOfPages = items.count
        updateContainerView(stepNumber: 0)
    }
    
    // MARK: -Public funcs
    func instanceViewController(_ index: Int) -> UIViewController {
        guard let viewController = UIStoryboard(name: "OnBoarding", bundle: Bundle.main).instantiateViewController(identifier: "OnBoardingSteps") as? OnBoardingStepsViewController else {
            return UIViewController()
        }
        
        viewController.item = items[index]
        return viewController
    }
    
    func updateContainerView(stepNumber index: Int) {
        setViewControllers([contentViewController[index]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: -Extensions
extension OnBoardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.firstIndex(of: viewController)
        if index == 0 {
            return nil
        }
        
        return contentViewController[index! - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.firstIndex(of: viewController)
        if index == contentViewController.count - 1 {
            return nil
        }
        
        return contentViewController[index! + 1]
    }
}

extension OnBoardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let index = contentViewController.firstIndex(of: viewControllers!.first!) else {
            return
        }
        
        pageControl?.currentPage = index
    }
}
