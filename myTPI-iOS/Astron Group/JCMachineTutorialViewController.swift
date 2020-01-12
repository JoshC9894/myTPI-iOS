//
//  JCMachineTutorialViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 26/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCMachineTutorialViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageTitles = NSArray(objects: "Add New Inspection", "Save New Inspection", "Open Checksheet", "Entering & Saving Data", "Using Selectors", "Generate Certificate/Report", "Finalize the Certificate/Report", "Adding Photos to a Report","Select Mail", "Compose & Send")
        self.pageImages = NSArray(objects: "add inspection", "save inspection", "pull up checklist", "entering data", "using selectors", "generate certificate", "extra info", "attachments", "email1", "send")
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "pageViewController1") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        let startVC = self.viewControllerAtIndex(0) 
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 30, width: self.view.frame.height, height: self.view.frame.height - 60)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func viewControllerAtIndex(_ index: Int) -> JCContentViewController1
    {
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count))
        {
            return JCContentViewController1()
        }
        let vc: JCContentViewController1 = self.storyboard?.instantiateViewController(withIdentifier: "contentViewController1") as! JCContentViewController1
        
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
        vc.pageIndex = index
        
        return vc
    }
    
    //Page view controler Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! JCContentViewController1
        var index = vc.pageIndex as Int
        if (index == 0 || index == NSNotFound){
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! JCContentViewController1
        var index = vc.pageIndex as Int
        if (index == NSNotFound){
            return nil
        }
        index += 1
        if (index == self.pageTitles.count){
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
    
    
    

}
