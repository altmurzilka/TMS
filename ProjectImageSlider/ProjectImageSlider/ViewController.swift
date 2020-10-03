//
//  ViewController.swift
//  ProjectImageSlider
//
//  Created by Алтын on 10/3/20.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController?
    
    let contentImages = ["flutter", "macos", "nlapi", "swiftui"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        setupPageControll()
        
    }
    
    func createPageViewController() {
        
        let pageController = self.storyboard?.instantiateViewController(identifier: "PageController") as! UIPageViewController
        
        pageController.dataSource = self
        
        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingviewControllers = [firstController]
            
            pageController.setViewControllers(startingviewControllers, direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        }
        
        pageViewController = pageController
        addChild(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController?.didMove(toParent: self)
    }
    
    func setupPageControll() {
        
        let appearence = UIPageControl.appearance()
        appearence.pageIndicatorTintColor = .gray
        appearence.currentPageIndicatorTintColor = .white
        appearence.backgroundColor = .darkGray
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! ItemViewController
        
        if itemController.itemIndex > 0 {
            
            return getItemController(itemController.itemIndex - 1)
        }
        return nil
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! ItemViewController
        
        if itemController.itemIndex + 1 < contentImages.count {
            
            return getItemController(itemController.itemIndex + 1)
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func currentController() -> UIViewController? {
        if (self.pageViewController?.viewControllers?.count)! > 0 {
            return self.pageViewController?.viewControllers![0]
        }
        return nil
    }
    
    func getItemController(_ itemIndex: Int) -> ItemViewController? {
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard?.instantiateViewController(identifier: "ItemController") as! ItemViewController
            
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    
}

