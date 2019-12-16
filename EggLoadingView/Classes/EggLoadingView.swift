//
//  EggLoadingView.swift
//  EggLoadingView
//
//  Created by Thanavat Chaopaknam on 13/12/2562 BE.
//

import Foundation
import UIKit
import EggDeviceExt

public protocol EggLoadingViewDelegate: class {
    func pressCloseButton(_ button: UIButton)
}

public class EggLoadingView: UIView {
    var isNewLoadingImage = false
    var isNewClosedImage = false
    
    var image: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var closeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var title: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: - Properties
    public weak var delegate: EggLoadingViewDelegate?
    
    // MARK: - Dynamic Properties
    private var _bgColor: UIColor = UIColor.black.withAlphaComponent(0.7)
    public var bgColor: UIColor! {
        get {
            return self._bgColor
        }
        set {
            self._bgColor = newValue
        }
    }
    
    private var _imageWidth: CGFloat = UIDevice.iPad ? 250 : 150
    public var imageWidth: CGFloat! {
        get {
            return self._imageWidth
        }
        set {
            self._imageWidth = newValue
        }
    }
    
    private var _imageHeight: CGFloat = UIDevice.iPad ? 250 : 150
    public var imageHeight: CGFloat! {
        get {
            return self._imageHeight
        }
        set {
            self._imageHeight = newValue
        }
    }
    
    private var _titleText: String = ""
    public var titleText: String! {
        get {
            return self._titleText
        }
        set {
            self._titleText = newValue
        }
    }
    
    private var _titleColor: UIColor = .white
    public var titleColor: UIColor! {
        get {
            return self._titleColor
        }
        set {
            self._titleColor = newValue
        }
    }
    
    private var _loadingImageName: String = "loading"
    public var loadingImageName: String! {
        get {
            return self._loadingImageName
        }
        set {
            self.isNewLoadingImage = true
            self._loadingImageName = newValue
        }
    }
    
    private var _closeButtonImageName: String = "ic_close.png"
    public var closeButtonImageName: String! {
        get {
            return self._closeButtonImageName
        }
        set {
            self.isNewClosedImage = true
            self._closeButtonImageName = newValue
        }
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(self.closeBtn)
        self.addSubview(self.title)
        self.addSubview(self.image)
        self.setupUI()
        self.backgroundColor = self._bgColor
    }
    
    private func setupUI() {
        
        let guide = safeAreaLayoutGuide
        self.closeBtn.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16).isActive = true
        self.closeBtn.widthAnchor.constraint(equalToConstant: UIDevice.iPad ? 40 : 20).isActive = true
        self.closeBtn.heightAnchor.constraint(equalToConstant: UIDevice.iPad ? 40 : 20).isActive = true
        self.closeBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.closeBtn.addTarget(self, action: #selector(hideView), for: .touchUpInside)
        self.closeBtn.setBackgroundImage(isNewClosedImage ? UIImage(named: _closeButtonImageName) : UIImage(named: _closeButtonImageName, in: Bundle(for: EggLoadingView.self), compatibleWith: nil), for: .normal)
        
        self.image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: _imageWidth).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: _imageHeight).isActive = true
        
        let imageData = try? Data(contentsOf: isNewLoadingImage ? Bundle.main.url(forResource: _loadingImageName, withExtension: "gif")! : Bundle(for: EggLoadingView.self).url(forResource: _loadingImageName, withExtension: "gif")!)
        let advTimeGif = UIImage.gifImageWithData(imageData!)
        self.image.image = advTimeGif
        
        self.title.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 8).isActive = true
        self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.title.textColor = _titleColor
        self.title.text = _titleText
    }
    
    @objc func hideView(sender: UIButton) {
           self.delegate?.pressCloseButton(sender)
           self.removeFromSuperview()
       }
    
    public func showLoadingView(_ isLoading: Bool, hasCloseBtn: Bool) {
        if isLoading {
            if let mWindow = UIApplication.shared.keyWindow {
                mWindow.addSubview(self)
                self.translatesAutoresizingMaskIntoConstraints = false
                self.leadingAnchor.constraint(equalTo: mWindow.leadingAnchor).isActive = true
                self.trailingAnchor.constraint(equalTo: mWindow.trailingAnchor).isActive = true
                self.topAnchor.constraint(equalTo: mWindow.topAnchor).isActive = true
                self.bottomAnchor.constraint(equalTo: mWindow.bottomAnchor).isActive = true
                self.closeBtn.isHidden = !hasCloseBtn
            }
        } else {
            self.hideLoadingView()
        }
    }
    
    // MARK: - Private Methods
    private func hideLoadingView() {
        self.removeFromSuperview()
    }
}
