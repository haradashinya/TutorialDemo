//
//  ViewController.swift
//  TutorialDemo
//
//  Created by HARADASHINYA on 2/4/15.
//  Copyright (c) 2015 HARADASHINYA. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIPageViewControllerDataSource {
    var pageTitles = ["page1","page2","page3"]
    var pageImages = ["page1.png","page2.png","page3.png"]
    var pageViewController:UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        var currentLabel:UILabel!
        var pageImages = ["page1.png","page2.png","page3.png"]
        let startingViewController = self.viewControllerAtIndex(0) as InnerPageViewController!

        self.pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)

        self.pageViewController.dataSource = self
        var viewControllers = [startingViewController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Reverse, animated: false, completion: nil)

        self.addChildViewController(self.pageViewController)
        self.pageViewController.view.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(self.pageViewController.view)
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewControllerAtIndex(index:Int) -> InnerPageViewController?{
        if self.pageTitles.count == 0 || index >= self.pageTitles.count {
            return nil
        }else{
            var pcvc = self.storyboard?.instantiateViewControllerWithIdentifier("InnerPageViewController") as InnerPageViewController!
            pcvc.imageFile = self.pageImages[index]
            pcvc.titleText = self.pageTitles[index]
            pcvc.pageIndex = index
            return pcvc
        }
    }


    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as InnerPageViewController).pageIndex

        if (index == NSNotFound) {
            return nil;
        }

        index++;
        if (index == self.pageTitles.count) {
            return nil;
        }
        return self.viewControllerAtIndex(index)
        
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        var index:Int = (viewController as InnerPageViewController).pageIndex
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
        
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}

