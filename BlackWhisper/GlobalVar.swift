//
//  GlobalVar.swift
//  BlackWhisper
//
//  Created by Daiki Kuyoshi on 2021/02/04.
//

open class GlobalVar {
    private init() {}
    static let shared = GlobalVar()

    var count: Int = 0
    var point: Int = 0
    var clear: Int = 0
    
    var userNames: [String] = Array(repeating: "", count: 4)
    var positionArray: [Int] = []
    var csvArray: [String] = []
    
    var posStringArray : [String] = []
    var text1Array : [String] = []
    var text2Array : [String] = []
}
