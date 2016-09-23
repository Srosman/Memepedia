//
//  SecondViewController.swift
//  Memepedia
//
//  Created by apcsp on 9/21/16.
//  Copyright © 2016 apcsp. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
 {

        @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var topText: UITextField!
   
    @IBOutlet weak var bottomText: UITextField!
    
     var imagePicker = UIImagePickerController()
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        self.picture.contentMode = .ScaleAspectFit //3
        self.picture.image = chosenImage //4
        dismissViewControllerAnimated(true, completion: nil) //5
        let memeFullController = self.storyboard?.instantiateViewControllerWithIdentifier("memeVC") as! FinalCreationMemeViewController
        memeFullController.image = chosenImage
        memeFullController.text1 = topText.text
        memeFullController.text2 = bottomText.text
        self.navigationController?.pushViewController(memeFullController, animated: true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func picButton(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        }

}
