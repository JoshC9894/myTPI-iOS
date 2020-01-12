//
//  JCLooseGearCertVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 21/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

var dateLG1 = String()
var locationLG1 = String()
var clientLG1 = String()
var addressLG1 = String()
var colourLG1 = String()
var timesheetLG1 = String()
var standardLG1 = String()
var inspectorLG1 = String()
var nextExamLG1 = String()
var nextTestLG1 = String()
var reasonLG1 = String()
var commentsLG1 = String()

var id1LG1: String?
var make1LG1 = String()
var desc1LG1 = String()
var swl1LG1 = String()
var cert1LG1 = String()
var load1LG1 = String()

var id2LG1 = String()
var make2LG1 = String()
var desc2LG1 = String()
var swl2LG1 = String()
var cert2LG1 = String()
var load2LG1 = String()

var id3LG1 = String()
var make3LG1 = String()
var desc3LG1 = String()
var swl3LG1 = String()
var cert3LG1 = String()
var load3LG1 = String()

var id4LG1 = String()
var make4LG1 = String()
var desc4LG1 = String()
var swl4LG1 = String()
var cert4LG1 = String()
var load4LG1 = String()

var id5LG1 = String()
var make5LG1 = String()
var desc5LG1 = String()
var swl5LG1 = String()
var cert5LG1 = String()
var load5LG1 = String()

var id6LG1 = String()
var swl6LG1 = String()
var make6LG1 = String()
var desc6LG1 = String()
var cert6LG1 = String()
var load6LG1 = String()

var id7LG1 = String()
var swl7LG1 = String()
var make7LG1 = String()
var desc7LG1 = String()
var cert7LG1 = String()
var load7LG1 = String()

var id8LG1 = String()
var swl8LG1 = String()
var make8LG1 = String()
var desc8LG1 = String()
var cert8LG1 = String()
var load8LG1 = String()

var id9LG1 = String()
var swl9LG1 = String()
var make9LG1 = String()
var desc9LG1 = String()
var cert9LG1 = String()
var load9LG1 = String()

var id10LG1 = String()
var swl10LG1 = String()
var make10LG1 = String()
var desc10LG1 = String()
var cert10LG1 = String()
var load10LG1 = String()

var id11LG1 = String()
var swl11LG1 = String()
var make11LG1 = String()
var desc11LG1 = String()
var cert11LG1 = String()
var load11LG1 = String()

var id12LG1 = String()
var swl12LG1 = String()
var make12LG1 = String()
var desc12LG1 = String()
var cert12LG1 = String()
var load12LG1 = String()

var id13LG1 = String()
var swl13LG1 = String()
var make13LG1 = String()
var desc13LG1 = String()
var cert13LG1 = String()
var load13LG1 = String()

var id14LG1 = String()
var swl14LG1 = String()
var make14LG1 = String()
var desc14LG1 = String()
var cert14LG1 = String()
var load14LG1 = String()

var id15LG1 = String()
var swl15LG1 = String()
var make15LG1 = String()
var desc15LG1 = String()
var cert15LG1 = String()
var load15LG1 = String()

var id16LG1 = String()
var swl16LG1 = String()
var make16LG1 = String()
var desc16LG1 = String()
var cert16LG1 = String()
var load16LG1 = String()

var id17LG1 = String()
var swl17LG1 = String()
var make17LG1 = String()
var desc17LG1 = String()
var cert17LG1 = String()
var load17LG1 = String()

var id18LG1 = String()
var swl18LG1 = String()
var make18LG1 = String()
var desc18LG1 = String()
var cert18LG1 = String()
var load18LG1 = String()

var id19LG1 = String()
var swl19LG1 = String()
var make19LG1 = String()
var desc19LG1 = String()
var cert19LG1 = String()
var load19LG1 = String()

class JCLooseGearCertVC: UIViewController, UIScrollViewDelegate {
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    //Outlets
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var clientField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var colourLabel: UILabel!
    @IBOutlet weak var timesheetLabel: UILabel!
    @IBOutlet weak var standardLabel: UILabel!
    
    @IBOutlet weak var id1Field: UITextField!
    @IBOutlet weak var id2Field: UITextField!
    @IBOutlet weak var id3Field: UITextField!
    @IBOutlet weak var id4Field: UITextField!
    @IBOutlet weak var id5Field: UITextField!
    @IBOutlet weak var id6Field: UITextField!
    @IBOutlet weak var id7Field: UITextField!
    @IBOutlet weak var id8Field: UITextField!
    @IBOutlet weak var id9Field: UITextField!
    @IBOutlet weak var id10Field: UITextField!
    @IBOutlet weak var id11Field: UITextField!
    @IBOutlet weak var id12Field: UITextField!
    @IBOutlet weak var id13Field: UITextField!
    @IBOutlet weak var id14Field: UITextField!
    @IBOutlet weak var id15Field: UITextField!
    @IBOutlet weak var id16Field: UITextField!
    @IBOutlet weak var id17Field: UITextField!
    @IBOutlet weak var id18Field: UITextField!
    @IBOutlet weak var id19Field: UITextField!
    
    @IBOutlet weak var make1Field: UITextField!
    @IBOutlet weak var make2Field: UITextField!
    @IBOutlet weak var make3Field: UITextField!
    @IBOutlet weak var make4Field: UITextField!
    @IBOutlet weak var make5Field: UITextField!
    @IBOutlet weak var make6Field: UITextField!
    @IBOutlet weak var make7Field: UITextField!
    @IBOutlet weak var make8Field: UITextField!
    @IBOutlet weak var make9Field: UITextField!
    @IBOutlet weak var make10Field: UITextField!
    @IBOutlet weak var make11Field: UITextField!
    @IBOutlet weak var make12Field: UITextField!
    @IBOutlet weak var make13Field: UITextField!
    @IBOutlet weak var make14Field: UITextField!
    @IBOutlet weak var make15Field: UITextField!
    @IBOutlet weak var make16Field: UITextField!
    @IBOutlet weak var make17Field: UITextField!
    @IBOutlet weak var make18Field: UITextField!
    @IBOutlet weak var make19Field: UITextField!
    
    @IBOutlet weak var desc1Field: UITextField!
    @IBOutlet weak var desc2Field: UITextField!
    @IBOutlet weak var desc3Field: UITextField!
    @IBOutlet weak var desc4Field: UITextField!
    @IBOutlet weak var desc5Field: UITextField!
    @IBOutlet weak var desc6Field: UITextField!
    @IBOutlet weak var desc7Field: UITextField!
    @IBOutlet weak var desc8Field: UITextField!
    @IBOutlet weak var desc9Field: UITextField!
    @IBOutlet weak var desc10Field: UITextField!
    @IBOutlet weak var desc11Field: UITextField!
    @IBOutlet weak var desc12Field: UITextField!
    @IBOutlet weak var desc13Field: UITextField!
    @IBOutlet weak var desc14Field: UITextField!
    @IBOutlet weak var desc15Field: UITextField!
    @IBOutlet weak var desc16Field: UITextField!
    @IBOutlet weak var desc17Field: UITextField!
    @IBOutlet weak var desc18Field: UITextField!
    @IBOutlet weak var desc19Field: UITextField!

    
    @IBOutlet weak var swl1Field: UITextField!
    @IBOutlet weak var swl2Field: UITextField!
    @IBOutlet weak var swl3Field: UITextField!
    @IBOutlet weak var swl4Field: UITextField!
    @IBOutlet weak var swl5Field: UITextField!
    @IBOutlet weak var swl6Field: UITextField!
    @IBOutlet weak var swl7Field: UITextField!
    @IBOutlet weak var swl8Field: UITextField!
    @IBOutlet weak var swl9Field: UITextField!
    @IBOutlet weak var swl10Field: UITextField!
    @IBOutlet weak var swl11Field: UITextField!
    @IBOutlet weak var swl12Field: UITextField!
    @IBOutlet weak var swl13Field: UITextField!
    @IBOutlet weak var swl14Field: UITextField!
    @IBOutlet weak var swl15Field: UITextField!
    @IBOutlet weak var swl16Field: UITextField!
    @IBOutlet weak var swl17Field: UITextField!
    @IBOutlet weak var swl18Field: UITextField!
    @IBOutlet weak var swl19Field: UITextField!

    @IBOutlet weak var cert1Field: UITextField!
    @IBOutlet weak var cert2Field: UITextField!
    @IBOutlet weak var cert3Field: UITextField!
    @IBOutlet weak var cert4Field: UITextField!
    @IBOutlet weak var cert5Field: UITextField!
    @IBOutlet weak var cert6Field: UITextField!
    @IBOutlet weak var cert7Field: UITextField!
    @IBOutlet weak var cert8Field: UITextField!
    @IBOutlet weak var cert9Field: UITextField!
    @IBOutlet weak var cert10Field: UITextField!
    @IBOutlet weak var cert11Field: UITextField!
    @IBOutlet weak var cert12Field: UITextField!
    @IBOutlet weak var cert13Field: UITextField!
    @IBOutlet weak var cert14Field: UITextField!
    @IBOutlet weak var cert15Field: UITextField!
    @IBOutlet weak var cert16Field: UITextField!
    @IBOutlet weak var cert17Field: UITextField!
    @IBOutlet weak var cert18Field: UITextField!
    @IBOutlet weak var cert19Field: UITextField!
    
    @IBOutlet weak var load1Field: UITextField!
    @IBOutlet weak var load2Field: UITextField!
    @IBOutlet weak var load3Field: UITextField!
    @IBOutlet weak var load4Field: UITextField!
    @IBOutlet weak var load5Field: UITextField!
    @IBOutlet weak var load6Field: UITextField!
    @IBOutlet weak var load7Field: UITextField!
    @IBOutlet weak var load8Field: UITextField!
    @IBOutlet weak var load9Field: UITextField!
    @IBOutlet weak var load10Field: UITextField!
    @IBOutlet weak var load11Field: UITextField!
    @IBOutlet weak var load12Field: UITextField!
    @IBOutlet weak var load13Field: UITextField!
    @IBOutlet weak var load14Field: UITextField!
    @IBOutlet weak var load15Field: UITextField!
    @IBOutlet weak var load16Field: UITextField!
    @IBOutlet weak var load17Field: UITextField!
    @IBOutlet weak var load18Field: UITextField!
    @IBOutlet weak var load19Field: UITextField!
    
    @IBOutlet weak var reasonField: UITextField!
    @IBOutlet weak var commentsField: UITextField!
    @IBOutlet weak var nextExamLabel: UILabel!
    @IBOutlet weak var nextTestLabel: UILabel!

    @IBOutlet weak var issueDateLabel: UILabel!
    @IBOutlet weak var inspectorField: UITextField!
    
    @IBOutlet weak var sendButton: UIBarButtonItem!
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        issueDateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
        
        dateField.text = dateLG1
        clientField.text = clientLG1
        addressField.text = addressLG1
        locationLabel.text = locationLG1
        colourLabel.text = colourLG1
        timesheetLabel.text = timesheetLG1
        standardLabel.text = standardLG1
        
        nextExamLabel.text = nextExamLG1
        nextTestLabel.text = nextTestLG1
        inspectorField.text = inspectorLG1
        reasonField.text = reasonLG1
        commentsField.text = commentsLG1
        
        
        
        
        id1Field.text = id1LG1
        id2Field.text = id2LG1
        id3Field.text = id3LG1
        id4Field.text = id4LG1
        id5Field.text = id5LG1
        id6Field.text = id6LG1
        id7Field.text = id7LG1
        id8Field.text = id8LG1
        id9Field.text = id9LG1
        id10Field.text = id10LG1
        id11Field.text = id11LG1
        id12Field.text = id12LG1
        id13Field.text = id13LG1
        id14Field.text = id14LG1
        id15Field.text = id15LG1
        id16Field.text = id16LG1
        id17Field.text = id17LG1
        id18Field.text = id18LG1
        id19Field.text = id19LG1
        
        print("\(id1LG1)")
        
        make1Field.text = make1LG1
        make2Field.text = make2LG1
        make3Field.text = make3LG1
        make4Field.text = make4LG1
        make5Field.text = make5LG1
        make6Field.text = make6LG1
        make7Field.text = make7LG1
        make8Field.text = make8LG1
        make9Field.text = make9LG1
        make10Field.text = make10LG1
        make11Field.text = make11LG1
        make12Field.text = make12LG1
        make13Field.text = make13LG1
        make14Field.text = make14LG1
        make15Field.text = make15LG1
        make16Field.text = make16LG1
        make17Field.text = make17LG1
        make18Field.text = make18LG1
        make19Field.text = make19LG1
        
        swl1Field.text = swl1LG1
        swl2Field.text = swl2LG1
        swl3Field.text = swl3LG1
        swl4Field.text = swl4LG1
        swl5Field.text = swl5LG1
        swl6Field.text = swl6LG1
        swl7Field.text = swl7LG1
        swl8Field.text = swl8LG1
        swl9Field.text = swl9LG1
        swl9Field.text = swl9LG1
        swl10Field.text = swl10LG1
        swl11Field.text = swl11LG1
        swl12Field.text = swl12LG1
        swl13Field.text = swl13LG1
        swl14Field.text = swl14LG1
        swl15Field.text = swl15LG1
        swl16Field.text = swl16LG1
        swl17Field.text = swl17LG1
        swl18Field.text = swl18LG1
        swl19Field.text = swl19LG1
        
        cert1Field.text = cert1LG1
        cert2Field.text = cert2LG1
        cert3Field.text = cert3LG1
        cert4Field.text = cert4LG1
        cert5Field.text = cert5LG1
        cert6Field.text = cert6LG1
        cert7Field.text = cert7LG1
        cert8Field.text = cert8LG1
        cert9Field.text = cert9LG1
        cert10Field.text = cert10LG1
        cert11Field.text = cert11LG1
        cert12Field.text = cert12LG1
        cert13Field.text = cert13LG1
        cert14Field.text = cert14LG1
        cert15Field.text = cert15LG1
        cert16Field.text = cert16LG1
        cert17Field.text = cert17LG1
        cert18Field.text = cert18LG1
        cert19Field.text = cert19LG1
        
        desc1Field.text = desc1LG1
        desc2Field.text = desc2LG1
        desc3Field.text = desc3LG1
        desc4Field.text = desc4LG1
        desc5Field.text = desc5LG1
        desc6Field.text = desc6LG1
        desc7Field.text = desc7LG1
        desc8Field.text = desc8LG1
        desc9Field.text = desc9LG1
        desc10Field.text = desc10LG1
        desc11Field.text = desc11LG1
        desc12Field.text = desc12LG1
        desc13Field.text = desc13LG1
        desc14Field.text = desc14LG1
        desc15Field.text = desc15LG1
        desc16Field.text = desc16LG1
        desc17Field.text = desc17LG1
        desc18Field.text = desc18LG1
        desc19Field.text = desc19LG1
        
        load1Field.text = load1LG1
        load2Field.text = load2LG1
        load3Field.text = load3LG1
        load4Field.text = load4LG1
        load5Field.text = load5LG1
        load6Field.text = load6LG1
        load7Field.text = load7LG1
        load8Field.text = load8LG1
        load9Field.text = load9LG1
        load10Field.text = load10LG1
        load11Field.text = load11LG1
        load12Field.text = load12LG1
        load13Field.text = load13LG1
        load14Field.text = load14LG1
        load15Field.text = load15LG1
        load16Field.text = load16LG1
        load17Field.text = load17LG1
        load18Field.text = load18LG1
        load19Field.text = load19LG1
        
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {

        return self.view
    }
    
    @IBAction func sendTapped(_ sender: AnyObject) {
        createPDF()
    }
    
    @IBAction func backTapped(_ sender: AnyObject) {
        dismissVC()
    }
    

    func dismissVC() {
        navigationController?.popToRootViewController(animated: true)
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
        
        let tempDirWithFilename = (NSTemporaryDirectory() as NSString).appendingPathComponent("\(clientField!.text!) loosegear certificate.pdf")
        
        pdfData.write(toFile: tempDirWithFilename, atomically: true)
        
        let aURL : URL = URL(fileURLWithPath: tempDirWithFilename)
        
        let objectsToShare : NSArray = [aURL]
        
        let activityVc = UIActivityViewController(activityItems: objectsToShare as [AnyObject], applicationActivities: nil)
        
        if let actv = activityVc.popoverPresentationController {
            actv.barButtonItem = sendButton
        }
        
        self.present(activityVc, animated: true, completion: nil)
        
    }

}
