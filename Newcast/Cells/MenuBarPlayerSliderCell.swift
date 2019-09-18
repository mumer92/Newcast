//
//  MenuBarPlayerSliderCell.swift
//  Newcast
//
//  Created by Nikhil Bolar on 9/18/19.
//  Copyright © 2019 Nikhil Bolar. All rights reserved.
//

import Cocoa

class MenuBarPlayerSliderCell: NSSliderCell {
    override var knobThickness: CGFloat {
        return knobWidth
    }
    
    let knobWidth: CGFloat = 3.0
    let knobHeight: CGFloat = 15.0
    let knobRadius: CGFloat = 2.0
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var percentage: CGFloat {
        get {
            if (self.maxValue - self.minValue) > 0 {
                return CGFloat((self.doubleValue - self.minValue) / (self.maxValue - self.minValue))
            } else {
                return 0
            }
        }
    }
    
    override func drawBar(inside aRect: NSRect, flipped: Bool) {
        var rect = aRect
        rect.size.height = CGFloat(6)
        let barRadius = CGFloat(2)
        let value = CGFloat((self.doubleValue - self.minValue) / (self.maxValue - self.minValue))
        let finalWidth = CGFloat(value * (self.controlView!.frame.size.width - 8))
        var leftRect = rect
        leftRect.size.width = finalWidth
        let bg = NSBezierPath(roundedRect: rect, xRadius: barRadius, yRadius: barRadius)
        NSColor.white.setFill()
        bg.fill()
        let active = NSBezierPath(roundedRect: leftRect, xRadius: barRadius, yRadius: barRadius)
        NSColor.init(red: 0.39, green: 0.82, blue: 1.0, alpha: 0.9).setFill()
        active.fill()
    }
    
    override func drawKnob(_ knobRect: NSRect) {
        NSColor.white.setFill()
        NSColor.white.setStroke()
        
        let rect = NSMakeRect(round(knobRect.origin.x),
                              knobRect.origin.y + 0.5 * (knobRect.height - knobHeight),
                              knobRect.width,
                              knobHeight)
        let path = NSBezierPath(roundedRect: rect, xRadius: knobRadius, yRadius: knobRadius)
        path.fill()
        path.stroke()
    }
    
    override func knobRect(flipped: Bool) -> NSRect {
        let bounds = super.barRect(flipped: flipped)
        let pos = min(percentage * bounds.width, bounds.width - 1);
        let rect = super.knobRect(flipped: flipped)
        let flippedMultiplier = flipped ? CGFloat(-1) : CGFloat(1)
        return NSMakeRect(pos - flippedMultiplier * 0.5 * knobWidth, rect.origin.y, knobWidth, rect.height)
    }
}
