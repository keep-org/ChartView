import SwiftUI

struct BarChartCellShape: Shape, Animatable {
    var value: Double
    var animatableData: CGFloat {
        get { CGFloat(value) }
        set { value = Double(newValue) }
    }

    func path(in rect: CGRect) -> Path {
        let barYvector = rect.height * CGFloat(-value)
        let x = 0.0
        let y: CGFloat
        let width = rect.width
        let height: CGFloat
        var cornerRadius: CGFloat = ceil(rect.width / 4.0)
        var path = Path()

        if value > 0.0 {
            y = rect.height + barYvector
            height = -barYvector
        }
        else if value.isZero {
            cornerRadius = ceil(rect.width / 8.0)
            y = rect.height - cornerRadius
            height = cornerRadius * 2.0
        }
        else {
            y = rect.height
            height = barYvector
        }

        path.addRoundedRect(in: CGRect(x: x, y: y, width: width, height: height),
                            cornerSize: CGSize(width: cornerRadius, height: cornerRadius))

        return path
    }
}

struct BarChartCellShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarChartCellShape(value: 0.75)
                .fill(Color.red)

            BarChartCellShape(value: 0.3)
                .fill(Color.blue)
        }
    }
}
