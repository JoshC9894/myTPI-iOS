//
//  JCReport2NavViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 14/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse
import CoreLocation

class JCReport2NavViewController: UIViewController, CLLocationManagerDelegate {
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var createButton: UIBarButtonItem!
    
    //Location
    let locationManager = CLLocationManager()
    
    //Parse Server
    var object: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.object = PFObject(className: "MachineDatabase")
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        let vc1 = JCReportWPViewController(nibName:"JCReportWPViewController", bundle: nil)
        
        self.addChildViewController(vc1)
        self.scrollView.addSubview(vc1.view)
        vc1.didMove(toParentViewController: self)
        
        let vc2 = JCReportWP2ViewController(nibName:"JCReportWP2ViewController", bundle: nil)
        
        //must add for additional views
        var frame1 = vc2.view.frame
        frame1.origin.x = self.view.frame.size.width
        vc2.view.frame = frame1
        
        self.addChildViewController(vc2)
        self.scrollView.addSubview(vc2.view)
        vc2.didMove(toParentViewController: self)
        
        let vc3 = JCReportWP3ViewController(nibName:"JCReportWP3ViewController", bundle: nil)
        
        //must add for additional views
        var frame2 = vc3.view.frame
        frame2.origin.x = self.view.frame.size.width*2
        vc3.view.frame = frame2
        
        self.addChildViewController(vc3)
        self.scrollView.addSubview(vc3.view)
        vc3.didMove(toParentViewController: self)
        
        let vc4 = JCChecklistReportWPViewController(nibName:"JCChecklistReportWPViewController", bundle: nil)
        
        //must add for additional views
        var frame3 = vc4.view.frame
        frame3.origin.x = self.view.frame.size.width*3
        vc4.view.frame = frame3
        
        self.addChildViewController(vc4)
        self.scrollView.addSubview(vc4.view)
        vc3.didMove(toParentViewController: self)
        
        let vc5 = JCChecklistReportWP2ViewController(nibName:"JCChecklistReportWP2ViewController", bundle: nil)
        
        //must add for additional views
        var frame4 = vc5.view.frame
        frame4.origin.x = self.view.frame.size.width*4
        vc5.view.frame = frame4
        
        self.addChildViewController(vc5)
        self.scrollView.addSubview(vc5.view)
        vc4.didMove(toParentViewController: self)
        //For additional views, frame1.origin.x = self.view.frame.size.width * 2 , then * 3 etc.
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 5, height: self.view.frame.size.height - 66)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createTapped(_ sender: AnyObject) {
        createPDF()
        
//        //Database
//        self.object["username"] = PFUser.currentUser()?.username
//        self.object["Fleet"] = fleet1
//        self.object["Serial"] = serial1
//        self.object["Client"] = client1
//        self.object["DateOfInspection"] = date11
//        self.object["Timesheet"] = timesheet1
//        self.object["Outcome"] = "Failed"
//        self.object["NextInspection"] = nextexam
//        locationManager
//        
//        
//        self.object.saveEventually() { (success, error) -> Void in
//            if (error == nil){
//                
//            }else{
//                print(error?.userInfo)
//            }
//        }
    }
    
    
    func createPDF() {
        
        let pdfData = NSMutableData()
        
        let scrollWidth = scrollView.contentSize.width
        
        let rawNumberOfPages = scrollWidth/CGFloat(764)
        let numberOfPages = Int(ceil(rawNumberOfPages))
        //
        
        var pageNumber = Int()
        
        let pageSize = CGSize(width: 764, height: 1020)
        
        UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero, nil)
        let pdfContext : CGContext = UIGraphicsGetCurrentContext()!
        
        repeat {
            
            UIGraphicsBeginPDFPageWithInfo(CGRect(x: 0, y: 0, width: pageSize.width, height: pageSize.height), nil)
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            
            if pageNumber < 1 {
                
                scrollView.layer.render(in: pdfContext)
                
            } else if pageNumber >= 1 {
                
                let offsetForScroll = CGFloat(pageNumber*764)
                
                scrollView.setContentOffset(CGPoint(x: offsetForScroll, y: 0), animated: false)
                
                UIGraphicsGetCurrentContext()?.translateBy(x: -offsetForScroll, y: 0)
                
                scrollView.layer.render(in: pdfContext)
                
            }
            
            pageNumber += 1
            
        }
            while pageNumber < numberOfPages
        
        UIGraphicsEndPDFContext()
        
        let tempDirWithFilename = (NSTemporaryDirectory() as NSString).appendingPathComponent("\(serial1!).pdf")
        
        pdfData.write(toFile: tempDirWithFilename, atomically: true)
        
        let aURL : URL = URL(fileURLWithPath: tempDirWithFilename)
        
        let objectsToShare : NSArray = [aURL]
        
        let activityVc = UIActivityViewController(activityItems: objectsToShare as [AnyObject], applicationActivities: nil)
        
        if let actv = activityVc.popoverPresentationController {
            actv.barButtonItem = createButton
        }
        
        self.present(activityVc, animated: true, completion: nil)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.object["LocationWhenCertificateSent"] = "\(locValue.latitude) \(locValue.longitude)"
    }
    
}
