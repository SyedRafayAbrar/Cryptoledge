//
//  HelperFile.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 09/06/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import Foundation
var updown=[Double]()
class _currency{
    private var _Name:String!
    private var _Short:String!
    private var _Price:String!
    private var _upD:Double!
  
    var name:String {
        set {
            _Name = newValue
        }
        get {
            return _Name!
        }
    }
    
    var short:String {
        set {
            _Short = newValue
        }
        get {
            return _Short
        }
    }
    var price:String {
        set {
            _Price = newValue
        }
        get {
            return _Price
        }
    }
   
    var upD:Double {
        set {
            _upD = newValue
        }
        get {
            return _upD
        }
    }
    
}
var exchangeName="USD"
var currencyList = [_currency]()
var coinName:String=""
