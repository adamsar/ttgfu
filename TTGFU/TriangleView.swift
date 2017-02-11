
import Foundation
import UIKit

class TriangleView : UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func draw(_ rect: CGRect) {
        let ctx : CGContext = UIGraphicsGetCurrentContext()!
        
        ctx.beginPath()
        ctx.move(to: CGPoint(x: rect.minX, y: rect.maxY / 2.0))
        ctx.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2.0))
        ctx.addLine(to: CGPoint(x: (rect.maxX/2.0), y: rect.minY))
        ctx.closePath()
        
        ctx.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.90);
        ctx.fillPath();
    }
}
