# SampleSelectSegmentedControl

A minimal project to reproduce a UISegmentedControl tap position bug in Xcode 26.

## Bug Description

When tapping an unselected `UISegmentedControl` that has dynamically set segments, the tap position is incorrectly calculated. For example, tapping the rightmost segment (index 3) results in the leftmost segment (index 0) being selected instead.

https://github.com/user-attachments/assets/11cd5502-5936-4da0-a788-b77e3049abc5

## Environment

- **Xcode**: 26.1.1, 26.2 (confirmed)
- **iOS**: 18.5, 26.2
- **Device**: Simulator and physical devices

## Conditions to Reproduce

All of the following conditions must be met:

1. **Build with Xcode 26.x**
2. **`UIDesignRequiresCompatibility` is set to `YES`** in Info.plist
3. **UISegmentedControl is laid out using Auto Layout**
4. **Segments are dynamically set** (e.g., using `insertSegment(withTitle:at:animated:)` after initialization)

## Steps to Reproduce

1. Clone this repository
2. Open `SampleSelectSegmentedControl.xcodeproj` in Xcode 26.x
3. Build and run on a simulator or device
4. Observe two `UISegmentedControl` instances:
   - **Top**: Standard UISegmentedControl with static segments ("Item 1", "Item 2", "Item 3")
   - **Bottom**: CustomSegmentedControl with dynamically set segments ("Item A", "Item B", "Item C", "Item D")
5. Tap on the **rightmost segment** of the bottom (custom) segmented control

## Expected Behavior

The rightmost segment ("Item D", index 3) should be selected.

## Actual Behavior

The leftmost segment ("Item A", index 0) is selected instead.

## Key Code

### CustomSegmentedControl.swift

```swift
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
```

### ViewController.swift

```swift
class ViewController: UIViewController {

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: CustomSegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        topSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment

        bottomSegmentedControl.setSegments(
            titles: ["Item A", "Item B", "Item C", "Item D"]
        )
        bottomSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
    }
}
```

### Info.plist

```xml
<key>UIDesignRequiresCompatibility</key>
<true/>
```

## Workaround

Currently investigating potential workarounds:

- Setting `UIDesignRequiresCompatibility` to `NO` (if acceptable for your app)
- Using static segments defined in Storyboard instead of dynamic insertion

## Blog Post

For more detailed analysis: https://dev.classmethod.jp/articles/xcode26-uisegmentedcontrol-tap-position-bug/

## Related Links

- Apple Developer Forums: (To be added)
- Feedback Assistant: FB21712773
