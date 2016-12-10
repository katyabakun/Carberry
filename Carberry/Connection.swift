//
//  Stream.swift
//  Carberry
//
//  Created by Katerina Bakun on 03/11/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit

struct Connection{
    var speed: String?
    var inStream : InputStream?
    var outStream: OutputStream?
    var buffer = [UInt8](repeating: 0, count: 200)
    
}
