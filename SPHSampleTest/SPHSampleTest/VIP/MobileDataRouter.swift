//
//  MobileDetailsRouter.swift
//  SPHSampleTest
//
//  Created by Chandresh on 7/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import Foundation
import UIKit

@objc protocol MobileDetailsRoutingLogic {
  func routeToSomewhere()
}

protocol MobileDetailsDataPassing {
  var dataStore: MobileDetailsDataStore? { get }
}

class MobileDataRouter: NSObject, MobileDetailsDataPassing {
  weak var viewController: MobileDataViewController?
  var dataStore: MobileDetailsDataStore?
  
  // MARK: Routing
/*  func routeToSomewhere() {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
  } */
}
