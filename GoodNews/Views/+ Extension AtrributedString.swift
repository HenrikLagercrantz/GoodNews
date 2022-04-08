//
//  + Extension AtrributedString.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-04-08.
//  Copyright © 2022 Zelo. All rights reserved.
//

import SwiftUI
import SwiftUIFlowLayout



struct StringWithAttributes: Hashable, Identifiable {
  let id = UUID()
  let string: String
  let attrs: [NSAttributedString.Key: Any]

  static func == (lhs: StringWithAttributes, rhs: StringWithAttributes) -> Bool {
   lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension NSAttributedString {
  var stringsWithAttributes: [StringWithAttributes] {
    var attributes = [StringWithAttributes]()
    enumerateAttributes(in: NSRange(location: 0, length: length), options: []) { (attrs, range, _) in
      let string = attributedSubstring(from: range).string
      attributes.append(StringWithAttributes(string: string, attrs: attrs))
    }
    return attributes
  }
}


extension Text {
    init(_ singleAttribute: StringWithAttributes) {
        let string = singleAttribute.string
        let attrs = singleAttribute.attrs
        var text = Text(string)
        
        if let font = attrs[.font] as? UIFont {
            text = text.font(.init(font))
        }
        
        if let color = attrs[.foregroundColor] as? UIColor {
            text = text.foregroundColor(Color(color))
        }
        
        if let kern = attrs[.kern] as? CGFloat {
            text = text.kerning(kern)
        }
        
        if #available(iOS 14.0, *) {
            if let tracking = attrs[.tracking] as? CGFloat {
                text = text.tracking(tracking)
            }
        }
        
        if let strikethroughStyle = attrs[.strikethroughStyle] as? NSNumber, strikethroughStyle != 0 {
            if let strikethroughColor = (attrs[.strikethroughColor] as? UIColor) {
                text = text.strikethrough(true, color: Color(strikethroughColor))
            } else {
                text = text.strikethrough(true)
            }
        }
        
        if let underlineStyle = attrs[.underlineStyle] as? NSNumber,
           underlineStyle != 0 {
            if let underlineColor = (attrs[.underlineColor] as? UIColor) {
                text = text.underline(true, color: Color(underlineColor))
            } else {
                text = text.underline(true)
            }
        }
        
        if let baselineOffset = attrs[.baselineOffset] as? NSNumber {
            text = text.baselineOffset(CGFloat(baselineOffset.floatValue))
        }
        
        self = text
    }
    
    init(_ attributes: [StringWithAttributes]) {
        self.init("")
        for singleAttribute in attributes {
            self = self + Text(singleAttribute)
        }
    }
    
    init(_ attributedString: NSAttributedString) {
        self.init(attributedString.stringsWithAttributes)
    }
}

struct HyperlinkText: View {
  private let strings: [StringWithAttributes]

  init(_ attributedString: NSAttributedString) {
    strings = attributedString.stringsWithAttributes
  }

  var body: some View {
    FlowLayout(mode: .vstack, // change to scrollable if embedding in ScrollView
               binding: .constant(false), // don't need a refresh binding
               items: strings,
               itemSpacing: 0) { string in
      if let link = string.attrs[.link],
         let url = link as? URL {
        Text(string)
          .onTapGesture {
            if UIApplication.shared.canOpenURL(url) {
              UIApplication.shared.open(url)
            }
          }
      } else {
        Text(string)
      }
    }
  }
}

extension HyperlinkText {
  init?(html: String) {
    if let data = html.data(using: .utf8),
       let attributedString = try? NSAttributedString(data: data,
                                                      options: [.documentType: NSAttributedString.DocumentType.html],
                                                      documentAttributes: nil) {
        self.init(attributedString)
    } else {
      return nil
    }
  }
}


