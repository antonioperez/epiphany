//
//  DetailEditorVC.swift
//  epiphany
//
//  Created by Antonio Perez on 4/22/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class DetailEditorVC: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailContent: UITextView!
    @IBOutlet weak var helpTxt: UILabel!
    
    var ideaTitle = ""
    var ideaDetail : IdeaDetail!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailContent.delegate = self
        
        updateUI()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(DetailEditorVC.adjustForKeyboard(_:)),
                                             name: UIKeyboardWillHideNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(DetailEditorVC.adjustForKeyboard(_:)),
                                             name: UIKeyboardWillChangeFrameNotification, object: nil)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK actions
    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func imagePickerButton(sender: AnyObject) {
        
    }
    
    //mark: functions
    func updateUI(){
        
        if let ideaDetails = self.ideaDetail {
            self.detailTitle.text = ideaDetails.subTitle
            self.detailContent.text = ideaDetails.content
            self.helpTxt.text = "Editing \(ideaDetails.subTitle) of \(ideaTitle)"
        }
    }
    
    //MARK: Keyboard functions
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if (text == "\n" ){
            let newLine = "\n> "
            let oldPos = detailContent.beginningOfDocument
            detailContent.text! += newLine
            if let cursorLocation: UITextPosition = detailContent.positionFromPosition(oldPos, offset: (range.location + newLine.characters.count)) {
                detailContent.selectedTextRange = detailContent.textRangeFromPosition(cursorLocation, toPosition: cursorLocation)
            }
            return false
        }
        return true
    }

    func adjustForKeyboard(notification: NSNotification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
        
        if notification.name == UIKeyboardWillHideNotification {
            detailContent.contentInset = UIEdgeInsetsZero
        } else {
            detailContent.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        detailContent.scrollIndicatorInsets = detailContent.contentInset
        let selectRange = detailContent.selectedRange
        detailContent.scrollRangeToVisible(selectRange)
    
    }
}
