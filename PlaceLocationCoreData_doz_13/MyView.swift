//
//  MyView.swift
//  PlaceLocationCoreData_doz_13
//
//  Created by Alexander Hoch on 25.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import UIKit
import SwiftUI

struct UIToSwiftView: UIViewRepresentable
{
   
    
     func makeUIView(context: Context) ->  MyView {
           // Return the UIView object
           let v = MyView()
           return v
       }
    
       func updateUIView(_ uiView:  MyView, context: Context) {
           // Update the view
       }
    
    
    
}


class MyView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        }
    
}
