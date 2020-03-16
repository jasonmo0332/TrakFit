//
//  MacawGraphView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/13/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import Macaw

class MacawGraphView: MacawView {
    required init?(coder aDecoder: NSCoder) {
        let button = MacawGraphView.createButton()
        let chart = MacawGraphView.createChart(button)
        super.init(node: Group(contents: [button, chart]), coder: aDecoder)
    }

    private static func createButton() -> Group {
        let shape = Shape(
            form: Rect(x: -100, y: -15, w: 200, h: 30).round(r: 5),
            fill: LinearGradient(degree: 90, from: Color(val: 0xfcc07c), to: Color(val: 0xfc7600)),
            stroke: Stroke(fill: Color(val: 0xff9e4f), width: 1))

        let text = Text(
            text: "Show", font: Font(name: "Serif", size: 21),
            fill: Color.white, align: .mid, baseline: .mid,
            place: .move(dx: 15, dy: 0))

        let image = Image(src: "charts.png", w: 30, place: .move(dx: -40, dy: -15))

        return Group(contents: [shape, text, image], place: .move(dx: 375 / 2, dy: 75))
    }
    
    private static func createChart(_ button: Node) -> Group {
        var items: [Node] = []
        for i in 1...6 {
            let y = 200 - Double(i) * 30.0
            items.append(Line(x1: -5, y1: y, x2: 275, y2: y).stroke(fill: Color(val: 0xF0F0F0)))
            items.append(Text(text: "\(i*30)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y)))
        }
        items.append(createBars(button))
        items.append(Line(x1: 0, y1: 200, x2: 275, y2: 200).stroke())
        items.append(Line(x1: 0, y1: 0, x2: 0, y2: 200).stroke())
        return Group(contents: items, place: .move(dx: 50, dy: 200))
    }

    private static func createBars(_ button: Node) -> Group {
        // leave it empty for now
        return Group()
    }
}
