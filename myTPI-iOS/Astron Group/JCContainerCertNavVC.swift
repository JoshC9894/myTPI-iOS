//
//  JCContainerCertNavVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 04/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCContainerCertNavVC: UIViewController {


    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = JCContainerCertVC1(nibName:"JCContainerCertVC1", bundle: nil)
        
        self.addChildViewController(vc1)
        self.scrollView.addSubview(vc1.view)
        vc1.didMove(toParentViewController: self)
        
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 1, height: self.view.frame.size.height - 66)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
