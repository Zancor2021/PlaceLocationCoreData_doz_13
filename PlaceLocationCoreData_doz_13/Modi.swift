//
//  Modi.swift
//  SwiftUI_MiniEditorSaveToFile_doz_11
//
//  Created by Alexander Hoch on 20.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import Foundation
import SwiftUI

struct OverlayBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:300,height:100,alignment:.center).background(Color.gray).cornerRadius(10).foregroundColor(Color.white)
    }
}

struct OverlayBox2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:450,height:150,alignment:.center).background(Color.orange).cornerRadius(10).foregroundColor(Color.white)
    }
}

struct ColorBtn: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:100,height:20,alignment:.center).background(Color.gray).cornerRadius(3).foregroundColor(Color.white)
    }
}

struct SliderTxt: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:100,height:20,alignment:.center).background(Color.gray).cornerRadius(3).foregroundColor(Color.white)
    }
}
