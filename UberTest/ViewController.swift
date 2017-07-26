//
//  ViewController.swift
//  UberTest
//
//  Created by 辛忠翰 on 2017/7/26.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit
import UberRides
import CoreLocation
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = RideRequestButton()
        button.center = view.center
//        button.colorStyle = .white
        button.imageView?.image = UIImage(named: "taxi")
        let dropoffLocation = CLLocation(latitude: 37.6213129, longitude: -122.3789554)
        let builder = RideParametersBuilder().setDropoffLocation(dropoffLocation, nickname: "Awesome Airport")
        button.rideParameters = builder.build()
        
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

