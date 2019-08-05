//
//  JapaneseCharacterSet.swift
//  SwiftExtension
//
//  Created by Albertus Liberius on 04/08/2019.
//  Copyright © 2019 Albertus Liberius. All rights reserved.
//

import Foundation

extension CharacterSet{
    class Japanese{
        static let hentaigana = CharacterSet(charactersIn: Unicode.Scalar(0x1B002)!...Unicode.Scalar(0x1B12F)!)
        
        /** Represents full-width Hiragana. */
        static var hiragana : CharacterSet{
            let ye = CharacterSet(charactersIn: "\u{1B001}")
            let kogakiWagyou = CharacterSet(charactersIn: "\u{1B150}"..."\u{1B152}")
            let hiraganaArea = CharacterSet(charactersIn: "\u{3040}"..."\u{309F}")
            return hiraganaArea + kogakiWagyou + ye
        }
        /** Represents full-width Katakana. */
        static var fullWidthKatakana: CharacterSet{
            let dakuten = CharacterSet(charactersIn: Unicode.Scalar(0x3099)!...Unicode.Scalar(0x309C)!)
            let katakanaArea = CharacterSet(charactersIn: Unicode.Scalar(0x30A0)!...Unicode.Scalar(0x30FF)!)
            let e = CharacterSet(charactersIn: "\u{1B000}")
            let kogakiWagyou = CharacterSet(charactersIn: Unicode.Scalar(0x1B164)!...Unicode.Scalar(0x1B167)!)
            return katakanaArea.union(dakuten).union(e).union(kogakiWagyou)
        }
        /** Represents half-width Katakana and half-width Japanese punctuations. */
        static var halfWidth: CharacterSet{
            return CharacterSet(charactersIn: Unicode.Scalar(0xFF61)!...Unicode.Scalar(0xFF9F)!)
        }
        /*
        static var punctuations: CharacterSet{
            let halfWidthPunc = CharacterSet(charactersIn: "\u{FF61}"..."\u{FF65}")
            let CJKPunc = CharacterSet(charactersIn: "\u{3000}"..."\u{3002}", "\u{3008}"..."\u{3011}", "\u{3014}"..."\u{301F}", "\u{3030}\u{303D}")
            let ellipsis = CharacterSet(charactersIn: "\u{2025}\u{2026}")
            let horizontalComma = CharacterSet(charactersIn: "\u{FF0C}")
            let extraBracketsNotInCJK = CharacterSet(charactersIn: "\u{FF08}\u{FF09}\u{FF3B}\u{FF3D}\u{FF5B}\u{FF5D}\u{FF5E}\u{FF60}")
            //halfwidth and fullwidth forms unicode block
            return halfWidthPunc + CJKPunc + ellipsis + horizontalComma + extraBracketsNotInCJK
        }*/
    }
}
