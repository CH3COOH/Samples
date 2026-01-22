//
//  ViewController.swift
//  SampleSelectSegmentedControl
//
//  Created by wada.kenji on 2026/01/22.
//

import UIKit

class ViewController: UIViewController {

    // 上のSegmentedControl（標準）
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!

    // 下のSegmentedControl（カスタム）
    @IBOutlet weak var bottomSegmentedControl: CustomSegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 未選択状態に設定
        topSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment

        // カスタムメソッドでセグメントを設定
        bottomSegmentedControl.setSegments(
            titles: ["Item A", "Item B", "Item C", "Item D"]
        )
        bottomSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
    }
}

