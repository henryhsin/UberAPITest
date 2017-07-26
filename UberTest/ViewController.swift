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
class ViewController: UIViewController{
    let ridesClient = RidesClient()
    let button = RideRequestButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let pickupLoaction = CLLocation(latitude: 25.021918, longitude: 121.535285)
        let dropoffLocation = CLLocation(latitude: 25.042119, longitude: 121.50668)
        var builder = RideParametersBuilder().setPickupLocation(pickupLoaction).setDropoffLocation(dropoffLocation, nickname: "西門紅樓")
        ridesClient.fetchCheapestProduct(pickupLocation: pickupLoaction) { (product, response) in
            if let productID = product?.productID{
                builder = builder.setProductID(productID)
                self.button.rideParameters = builder.build()
                // show estimate
                self.button.loadRideInformation()
            }
        }
        button.center = view.center
        button.colorStyle = .black
        view.addSubview(button)
        button.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func rideRequestButton(_ button: RideRequestButton, didReceiveError error: RidesError) {
//        
//    }
//    
//    func rideRequestButtonDidLoadRideInformation(_ button: RideRequestButton) {
//        button.sizeToFit()
//        button.center = view.center
//    }

}

extension ViewController: RideRequestButtonDelegate{
    /**
     The button encountered an error when refreshing its metadata content.
     
     - parameter button: the RideRequestButton
     - parameter error:  the error that it encountered
     */
    func rideRequestButton(_ button: RideRequestButton, didReceiveError error: RidesError) {
        
    }

    func rideRequestButtonDidLoadRideInformation(_ button: RideRequestButton) {
        button.sizeToFit()
        button.center = view.center
    }
}

