//
//  CharacterSet.swift
//  SwiftExtension
//
//  Created by Albertus Liberius on 04/08/2019.
//  Copyright © 2019 Albertus Liberius. All rights reserved.
//

import Foundation

func + (lhs: CharacterSet, rhs: CharacterSet) -> CharacterSet{
    return lhs.union(rhs)
}

prefix func ~(comp: CharacterSet) -> CharacterSet{
    return comp.inverted
}

func * (lhs: CharacterSet, rhs: CharacterSet) -> CharacterSet{
    return lhs.intersection(rhs)
}

func - (lhs: CharacterSet, rhs: CharacterSet) -> CharacterSet{
    return lhs.subtracting(rhs)
}

protocol UnicodeScalarValueRange{}


extension Range : UnicodeScalarValueRange where Bound == UnicodeScalar{
    
}

extension ClosedRange : UnicodeScalarValueRange where Bound == UnicodeScalar{
    
}

extension UnicodeScalar: UnicodeScalarValueRange{
    
}

extension String: UnicodeScalarValueRange{

}
 
extension CharacterSet{
    init(charactersIn: UnicodeScalarValueRange...){
        self = CharacterSet()
        for scalar in charactersIn{
            if let range = scalar as? ClosedRange<UnicodeScalar>{
                self = self.union(CharacterSet(charactersIn: range))
            }else if let range = scalar as? Range<UnicodeScalar>{
                self = self.union(CharacterSet(charactersIn: range))
            }else if let range = scalar as? UnicodeScalar{
                self = self.union(CharacterSet(charactersIn: String(range)))
            }else if let range = scalar as? String{
                self = self.union(CharacterSet(charactersIn: range))
            }
        }
    }
}

