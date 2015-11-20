//: Playground - noun: a place where people can play

import UIKit

//A reference to remind myself how method swizzling is implemented in Swift

//With a class function in a class created by me:
@objc class TestClass: NSObject { dynamic class func myTestFunction() { print("original test function") } }
extension TestClass {
    dynamic class func custom_testFunction() { print("custom test function") }
}

//In the view controller class:
//extension UIViewController {
//    func custom_viewDidLoad() { print("custom view did load!") }
//}


class AppDelegate {
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //in the view controller class:
        //        method_exchangeImplementations(
        //            class_getInstanceMethod(UIViewController.self, "viewDidLoad"),
        //            class_getInstanceMethod(UIViewController.self, "custom_viewDidLoad")
        //        )
        
        //in my test class:
        method_exchangeImplementations(
            class_getClassMethod(TestClass.self, "myTestFunction"),
            class_getClassMethod(TestClass.self, "custom_testFunction")
        )
        TestClass.myTestFunction() //should print: "custom test function"
        
        return true
    }
}