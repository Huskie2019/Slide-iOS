//
//  CellContent.swift
//  Slide for Reddit
//
//  Created by Carlos Crane on 12/31/16.
//  Copyright © 2016 Haptic Apps. All rights reserved.
//
import UIKit
import UZTextView

struct CellContent {
    let attributedString: NSAttributedString
    let textHeight: CGFloat
    let id: String
    
    init(string: NSAttributedString, width: CGFloat, id: String) {
        attributedString = string
        self.id = id
        let horizontalMargin = CommentDepthCell.margin().left + CommentDepthCell.margin().right
        let verticalMargin = CommentDepthCell.margin().top + CommentDepthCell.margin().bottom
        let size = UZTextView.size(for: attributedString, withBoundWidth:width - horizontalMargin, margin: UIEdgeInsetsMake(0, 0, 0, 0))
        textHeight = size.height + verticalMargin
    }
    
    init(string: String, width: CGFloat, fontSize: CGFloat = 14, id: String) {
        self.id = id
        let font = UIFont(name: UIFont.systemFont(ofSize: fontSize).fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        attributedString = NSAttributedString(string: string, attributes: [NSFontAttributeName : font])
        let horizontalMargin = CommentDepthCell.margin().left + CommentDepthCell.margin().right
        let verticalMargin = CommentDepthCell.margin().top + CommentDepthCell.margin().bottom
        let size = UZTextView.size(for: attributedString, withBoundWidth:width - horizontalMargin, margin: UIEdgeInsetsMake(0, 0, 0, 0))
        textHeight = size.height + verticalMargin
    }
    
    init(string: NSAttributedString, width: CGFloat, hasRelies: Bool, id: String) {
        attributedString = string
        self.id = id
        let horizontalMargin = CommentDepthCell.margin().left + CommentDepthCell.margin().right
        let verticalMargin = CommentDepthCell.margin().top + CommentDepthCell.margin().bottom
        let size = UZTextView.size(for: attributedString, withBoundWidth:width - horizontalMargin, margin: UIEdgeInsetsMake(0, 0, 0, 0))
        if hasRelies {
            textHeight = size.height + verticalMargin
        } else {
            textHeight = size.height + verticalMargin
        }
    }
    
    init(string: NSAttributedString, width: CGFloat) {
        attributedString = string
        self.id = ""
        let size = UZTextView.size(for: attributedString, withBoundWidth:width, margin: UIEdgeInsetsMake(0, 0, 0, 0))
        textHeight = size.height
    }

    
    init(string: String, width: CGFloat, hasRelies: Bool, fontSize: CGFloat = 14, id: String) {
        self.id = id
        let font = UIFont(name: UIFont.systemFont(ofSize: fontSize).fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        attributedString = NSAttributedString(string: string, attributes: [NSFontAttributeName : font])
        let horizontalMargin = CommentDepthCell.margin().left + CommentDepthCell.margin().right
        let verticalMargin = CommentDepthCell.margin().top + CommentDepthCell.margin().bottom
        let size = UZTextView.size(for: attributedString, withBoundWidth:width - horizontalMargin, margin: UIEdgeInsetsMake(0, 0, 0, 0))
        if hasRelies {
            textHeight = size.height + verticalMargin
        } else {
            textHeight = size.height + verticalMargin
        }
    }
}