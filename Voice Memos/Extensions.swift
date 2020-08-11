//
//  Extensions.swift
//  Voice Memos
//
//  Created by Surya Chappidi on 11/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import Foundation

//Date formatter

extension Date{
    func toString( dateFormat format : String ) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
