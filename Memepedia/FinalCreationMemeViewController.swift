//
//  FinalCreationMemeViewController.swift
//  Memepedia
//
//  Created by apcsp on 9/22/16.
//  Copyright © 2016 apcsp. All rights reserved.
//

import UIKit

class FinalCreationMemeViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var topTextLabel: UILabel!
    
    @IBOutlet weak var bottomTextLabel: UILabel!
    var image: UIImage!
    var text1: String!
    var text2: String!
    override func viewDidLoad()
        {
        super.viewDidLoad()
            if (image != nil){
                imageView.image = image
                topTextLabel.text = text1
                topTextLabel.textColor = UIColor.whiteColor()
                topTextLabel.sizeToFit()
                imageView.addSubview(topTextLabel)
                
              bottomTextLabel.text = text2
                 bottomTextLabel.textColor = UIColor.whiteColor()
                 bottomTextLabel.sizeToFit()
                imageView.addSubview( bottomTextLabel)
            }
            else {
                print("image nil")
            }

        }
    func takeScreenshot(theView: UIView) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0.0)
        theView.drawViewHierarchyInRect(theView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        dispatch_async(dispatch_get_main_queue(), {
            UIAlertView(title: "Success", message: "The meme has been saved to your Camera Roll", delegate: nil, cancelButtonTitle: "Close").show()
        })
    }
    
    @IBAction func saveButton(sender: UIButton) {
        print("Screenshot")
        let image = takeScreenshot(imageView)
        UIImageWriteToSavedPhotosAlbum(image, self, Selector("image:didFinishSavingWithError:contextInfo:"), nil)
    }


}