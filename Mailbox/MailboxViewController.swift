//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Garay,Jerry on 9/5/16.
//  Copyright © 2016 Garay,Jerry. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    
    
    @IBOutlet weak var MailboxScrollView: UIScrollView!
    @IBOutlet weak var messageParentView: UIView!
    @IBOutlet weak var screenParentView: UIView!
    @IBOutlet weak var messageView: UIImageView!
    
    var messageOriginalCenter = CGPoint!()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MailboxScrollView.contentSize = CGSize(width: 320, height: 2100)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
            messageOriginalCenter = messageView.center

        }
        else if sender.state == UIGestureRecognizerState.Changed {
            
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            
            messageView.center = CGPoint(x: messageOriginalCenter.x, y: messageOriginalCenter.y)
           
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
