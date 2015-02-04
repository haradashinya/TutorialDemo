//
//  InnerPageViewController.swift
//  TutorialDemo
//
//  Created by HARADASHINYA on 2/4/15.
//  Copyright (c) 2015 HARADASHINYA. All rights reserved.
//

import Foundation
import UIKit

class InnerPageViewController: UIViewController {
    var imageFile:NSString!
    var titleText:NSString!
    var pageIndex:Int = 0
    var imageView: UIImageView = UIImageView(frame: CGRectZero)

    override func viewDidLoad() {
        super.viewDidLoad()
        var image = UIImage(named: imageFile)
        self.imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)
        self.imageView.layer.backgroundColor = UIColor.orangeColor().CGColor
        self.imageView.image = image
        self.view.addSubview(self.imageView)
    }
    func onBack(sender:AnyObject){
        println("ONBACK")
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