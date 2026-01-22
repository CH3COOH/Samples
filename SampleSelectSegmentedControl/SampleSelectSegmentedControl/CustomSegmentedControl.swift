import UIKit

class CustomSegmentedControl: UISegmentedControl {

    func setSegments(titles: [String]) {
        removeAllSegments()
        titles.forEach { title in
            insertSegment(
                withTitle: title,
                at: numberOfSegments,
                animated: false
            )
        }
    }
}
