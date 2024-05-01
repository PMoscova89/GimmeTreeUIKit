//
//  ViewController.swift
//  GimmeTree
//
//  Created by Patrick Moscova on 5/1/24.
//

import UIKit

@objc
class TreeViewController: UIViewController {

    var binaryTreeViewModel = BinaryTreeViewModel<Int>()
    var binaryTreeView: BinaryTreeView<Int>? = nil
    @IBOutlet weak var treeViewFrame: UIView!// To let you know where the frame is.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let treeColor = #colorLiteral(red: 0.2911695242, green: 0.7401337624, blue: 0, alpha: 0.8852306548)
        binaryTreeView = BinaryTreeView(frame: treeViewFrame.frame, viewModel: binaryTreeViewModel, backgroundColor: treeColor)
        if let binaryTreeView = binaryTreeView {
            self.view.addSubview(binaryTreeView)
        }
    }

    @IBAction func addNode(_ sender: Any) {
        let value = Int.random(in: 1...100)
        binaryTreeView?.addNode(value: value)
    }
    
}

