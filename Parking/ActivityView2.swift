//
//  ActivityView2.swift
//  Parking
//
//  Created by Johnny Parham on 6/25/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit

class ActivityView2: UIView {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var activityViewIndicator: UIActivityIndicatorView!
    
    func setUpView() {
        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.95)
        self.label.textColor = UIColor.whiteColor()
        self.label.backgroundColor = UIColor.clearColor()
    }

}
