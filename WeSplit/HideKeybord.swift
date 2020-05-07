//
//  HideKeybord.swift
//  WeSplit
//
//  Created by Neha Gupta on 05/05/20.
//  Copyright © 2020 Neha Gupta. All rights reserved.
//

import UIKit

class HideKeybord {

}

extension UIApplication {
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
}
