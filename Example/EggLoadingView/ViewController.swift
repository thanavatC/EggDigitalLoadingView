//
//  ViewController.swift
//  EggLoadingView
//
//  Created by Thanavat Chaopaknam on 12/11/2019.
//  Copyright (c) 2019 Thanavat Chaopaknam. All rights reserved.
//

import UIKit
import EggLoadingView

class ViewController: UIViewController {

    let loadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingView.loadingImageName = "loading2.gif"
        self.loadingView.delegate = self
        self.loadingView.showLoadingView(true, hasCloseBtn: false)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - LoadingViewDelegate
extension ViewController: LoadingViewDelegate {
    func pressCloseButton(_ button: UIButton) {
        print("Close Button Click")
    }
}
