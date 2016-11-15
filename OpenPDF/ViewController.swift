//
//  ViewController.swift
//  OpenPDF
//
//  Created by WillowRivers on 2016/11/14.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate{

    @IBOutlet weak var myWebV: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad() ;
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openURLF(_ sender: AnyObject) {
        //let path = "http://info.3g.qq.com/g/s?aid=index&from=wap3g&s_it=1&sid=00" ;
        //let url = URL(string: urlString) ;
        
        let path = NSHomeDirectory() + "/".appending("Documents") + "/".appending("16_3934_00_e.pdf") ;
       
        
        let url = NSURL.fileURL(withPath: path) ;
        let request = NSURLRequest(url: url) ;
        myWebV.loadRequest(request as URLRequest) ;
        
//        let path = "http://info.3g.qq.com/g/s?aid=index&from=wap3g&s_it=1&sid=00" ;
//        let path = NSHomeDirectory() + "/".appending("Documents") + "/".appending("16_3934_00_e.pdf") ;
//        let url = URL(fileURLWithPath: path , isDirectory: false) ;
//        let url = URL(string: path) ;
//        UIApplication.shared.open(url! , options: [:], completionHandler: nil)  ;
        print("path is :\(path)") ;
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        let requestURL = request.url ;
        if ((requestURL?.scheme?.hasPrefix("http"))! || (requestURL?.scheme?.hasPrefix("https"))! || (requestURL?.scheme?.hasPrefix("mailto"))!) && (navigationType == UIWebViewNavigationType.linkClicked)
        {
            return !(UIApplication.shared.canOpenURL(requestURL!)) ;
        }
        
        return true ;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

