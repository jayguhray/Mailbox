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
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var feedView: UIImageView!
    
    
    var messageOriginalCenter = CGPoint!()
    var archiveOriginalCenter = CGPoint!()
    var deleteOriginalCenter = CGPoint!()
    var laterOriginalCenter = CGPoint!()
    var listOriginalCenter = CGPoint!()
    
    var feedOriginalCenter = CGPoint!()

    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var menuImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MailboxScrollView.contentSize = CGSize(width: 320, height: 2100)
        
        listView.alpha = 0
        rescheduleView.alpha = 0

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didScreenEdgePanGesture(sender: UIScreenEdgePanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
        }
        
        else if sender.state == UIGestureRecognizerState.Changed {
            screenParentView.frame.origin.x = translation.x
            
            
        }
        
        else if sender.state == UIGestureRecognizerState.Ended {
            if translation.x > 150 {
                screenParentView.frame.origin.x = 300
            }
            else if translation.x < 150 {
                screenParentView.frame.origin.x = 0
            }
        }
    }
    
    
    
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        let bgColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        let archiveColor = UIColor(red: 60/255, green: 170/255, blue: 95/255, alpha: 1.0)
        let deleteColor = UIColor(red: 229/255, green: 66/255, blue: 70/255, alpha: 1.0)
        let listColor = UIColor(red: 197/255, green: 154/255, blue: 102/255, alpha: 1.0)
        let laterColor = UIColor(red: 242/255, green: 208/255, blue: 52/255, alpha: 1.0)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
            messageOriginalCenter = messageView.center
            archiveOriginalCenter = archiveIcon.center
            deleteOriginalCenter = deleteIcon.center
            laterOriginalCenter = laterIcon.center
            listOriginalCenter = listIcon.center
            
            
            deleteIcon.alpha = 0
            listIcon.alpha = 0
            
            messageParentView.backgroundColor = bgColor
            
            rescheduleView.alpha = 0
            listView.alpha = 0
            

        }
        else if sender.state == UIGestureRecognizerState.Changed {
            
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            archiveIcon.center = CGPoint(x: archiveOriginalCenter.x + translation.x - 60, y: archiveOriginalCenter.y)
            deleteIcon.center = CGPoint(x: deleteOriginalCenter.x + translation.x - 60, y: deleteOriginalCenter.y)
            laterIcon.center = CGPoint(x: laterOriginalCenter.x + translation.x + 60, y: laterOriginalCenter.y)
            listIcon.center = CGPoint(x: listOriginalCenter.x + translation.x + 60, y: listOriginalCenter.y)
            
            if translation.x < 40 {
                archiveIcon.alpha = 0
            }
            
            
            if translation.x > 260 {
                UIView.animateWithDuration(0.3, animations: {
                    self.messageParentView.backgroundColor = deleteColor
                    self.deleteIcon.alpha = 1
                    self.archiveIcon.alpha = 0;
                })
            }
            
            else if translation.x > 40 {
                UIView.animateWithDuration(0.3, animations: {
                    self.messageParentView.backgroundColor = archiveColor
                    self.deleteIcon.alpha = 0
                    self.archiveIcon.alpha = 1
                })
            }
                
            else if translation.x > -40{
                laterIcon.alpha = 0
            }
            
            
            else if translation.x < -260 {
                UIView.animateWithDuration(0.3, animations: { 
                    self.messageParentView.backgroundColor = listColor
                    self.laterIcon.alpha = 0
                    self.listIcon.alpha = 1
                })
            }
            
            else if translation.x < -40 {
                UIView.animateWithDuration(0.3, animations: { 
                    self.messageParentView.backgroundColor = laterColor
                    self.laterIcon.alpha = 1
                    self.listIcon.alpha = 0
                })
            }
            
        }
            
        else if sender.state == UIGestureRecognizerState.Ended {
            
            messageView.center = messageOriginalCenter
            
            //messageView.center = CGPoint(x: messageOriginalCenter.x, y: messageOriginalCenter.y)
            
            messageParentView.backgroundColor = bgColor
            
            archiveIcon.center = archiveOriginalCenter
            deleteIcon.center = deleteOriginalCenter
            laterIcon.center = laterOriginalCenter
            listIcon.center = listOriginalCenter
            
            deleteIcon.alpha = 0
            archiveIcon.alpha = 1
            listIcon.alpha = 0
            laterIcon.alpha = 1
            
            if translation.x > 40 {
                UIView.animateWithDuration(0.3, animations: {
                    self.feedView.frame.origin.y -= 80
                    self.messageParentView.alpha = 0
                })
            }
            
            else if translation.x <= -260 {
                listView.alpha = 1
            }
            
            else if translation.x < -60 {
                rescheduleView.alpha = 1
            }
           
        }
        
    }
    
    
    @IBAction func didTapReschedule(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.1, animations: {
            self.rescheduleView.alpha = 0
            }) { (Bool) in
                UIView.animateWithDuration(0.3, animations: { 
                    self.feedView.frame.origin.y -= 80
                    self.messageParentView.alpha = 0
                })
                
        }
        
        
    }
    
    @IBAction func didTapList(sender: UITapGestureRecognizer) {
        listView.alpha = 0
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
