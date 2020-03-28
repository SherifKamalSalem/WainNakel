//
//  SuggestionView.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit
import SnapKit
import MapKit
import NVActivityIndicatorView

class SuggestionView: BaseView {
    let viewModel: SuggestionViewModel
    
    init(frame: CGRect = .zero,
         viewModel: SuggestionViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    var wainNakelLblBottomConstraintToSV: Constraint?
    var suggestBtnRightToSVContraint: Constraint?
    var suggestBtnBottomConstraintToSV: Constraint?
    var suggestBtnBottmContraintToLbl: Constraint?
    var settingsBtnBottomConstraintToSV: Constraint?
    var settingsBtnBottmContraintToLbl: Constraint?
    var settingsBtnLeftContraintToSV: Constraint?
    var settingsBtnRightContraintToSuggestBtn: Constraint?
    var suggestBtnWidthConstraint: Constraint?
    var suggestBtnCenterToSVConstraint: Constraint?
    var suggestBtnTrailingToSVConstraint: Constraint?
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView(frame: self.bounds)
        mapView.mapType = MKMapType.standard
        let newCamera: MKMapCamera = MKMapCamera(lookingAtCenter: mapView.camera.centerCoordinate, fromDistance: 1000000.0, pitch: 10.0, heading: 0.0)
        mapView.setCamera(newCamera, animated: true)
        mapView.isZoomEnabled = true
        mapView.backgroundColor = .clear
        mapView.showsUserLocation = true
        mapView.isScrollEnabled = true
        return mapView
    }()
    
    let gradientView: UIView = {
        return GradientView()
    }()
    //MARK: - Top View
    let mapTopView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        return view
    }()
    
    lazy var topViewContainerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [resturantNameLabel, mapTopViewBtnsStack])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
    
    let resturantNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainColor
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.text = "Failed"
        return label
    }()
    
    let mapTopViewBtnsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [UIImageView(image: #imageLiteral(resourceName: "map")), UIImageView(image: #imageLiteral(resourceName: "gallery")), UIImageView(image: #imageLiteral(resourceName: "favorite")), UIImageView(image: #imageLiteral(resourceName: "share"))])
        stack.axis = .horizontal
        stack.spacing = 30
        stack.distribution = .equalCentering
        return stack
    }()
    
    let suggestButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitle("", for: .disabled)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(suggestButtonTapped), for: .touchUpInside)
        button.setTitleColor(UIColor.mainDarkColor, for: .normal)
        button.setTitle(Constants.UI.SuggestButtonTitle, for: .normal)
        return button
    }()
    
    @objc func suggestButtonTapped() {
        suggestButton.addSubview(activityIndicatorView)
        suggestButton.setTitle("", for: .normal)
        activityIndicatorView.snp.makeConstraints { make in
            make.edges.equalTo(suggestButton)
            make.center.equalTo(suggestButton)
        }
        activityIndicatorView.startAnimating()
        animateConstraintAfterSuggestBtnTapped()
    }
    
    func animateConstraintAfterSuggestBtnTapped() {
        self.suggestBtnWidthConstraint?.update(offset: 100)
        suggestButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            suggestBtnTrailingToSVConstraint?.deactivate()
            
        }
        self.settingsButton.isHidden = true
        UIView.animate(withDuration: 0.8) {
            self.layoutIfNeeded()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.activityIndicatorView.stopAnimating()
            self.gradientView.removeFromSuperview()
            self.resturantIcon.removeFromSuperview()
            self.wainNakelLabel.removeFromSuperview()
            self.wireTopView()
        }
    }
    
    let activityIndicatorView: NVActivityIndicatorView = {
        let indicator = NVActivityIndicatorView(frame: .zero, type: .ballPulse, color: UIColor.mainColor, padding: 0)
        return indicator
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.setImage(#imageLiteral(resourceName: "settingsIcon"), for: .normal)
        return button
    }()
    
    let wainNakelLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = Constants.Text.WainNakel
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let resturantIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "splashIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func constructLaunchViewHierarchy() {
        self.addSubview(resturantIcon)
        self.addSubview(wainNakelLabel)
        self.addSubview(suggestButton)
        self.addSubview(settingsButton)
    }
    
    func activateLaunchViewConstraints() {
        resturantIcon.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.size.equalTo(70)
        }
        
        wainNakelLabel.snp.makeConstraints { make in
            self.wainNakelLblBottomConstraintToSV = make.bottom.equalTo(self).offset(50).constraint
            make.centerX.equalTo(self)
        }
        
        suggestButton.snp.makeConstraints { make in
            self.suggestBtnRightToSVContraint = make.trailing.equalTo(self).offset(50).constraint
            self.suggestBtnBottomConstraintToSV = make.bottom.equalTo(self).offset(50).constraint
            self.suggestBtnBottmContraintToLbl = make.top.equalTo(wainNakelLabel.snp.bottom).offset(40).constraint
            self.suggestBtnBottmContraintToLbl?.deactivate()
        }
        
        settingsButton.snp.makeConstraints { make in
            self.settingsBtnLeftContraintToSV = make.leading.equalTo(self).offset(-50).constraint
            self.settingsBtnBottomConstraintToSV = make.bottom.equalTo(self).offset(50).constraint
            self.settingsBtnBottmContraintToLbl = make.top.equalTo(wainNakelLabel.snp.bottom).offset(40).constraint
            self.settingsBtnBottmContraintToLbl?.deactivate()
        }
        self.layoutIfNeeded()
    }
    
    func animateLaunchViewConstraints() {
        wainNakelLabel.snp.makeConstraints { make in
            self.wainNakelLblBottomConstraintToSV?.deactivate()
            make.top.equalTo(resturantIcon.snp.bottom).offset(40)
        }
          
        suggestButton.snp.makeConstraints { make in
            self.suggestBtnBottomConstraintToSV?.deactivate()
            self.suggestBtnRightToSVContraint?.deactivate()
            self.suggestBtnBottmContraintToLbl?.activate()
            self.suggestBtnTrailingToSVConstraint = make.trailing.equalTo(self).offset(-75).constraint
            self.suggestBtnWidthConstraint = make.width.equalTo(self).multipliedBy(0.5).constraint
            make.height.equalTo(50)
        }
        
        settingsButton.snp.makeConstraints { make in
            self.settingsBtnBottomConstraintToSV?.deactivate()
            self.settingsBtnLeftContraintToSV?.deactivate()
            self.settingsBtnBottmContraintToLbl?.activate()
            make.leading.equalTo(self).offset(75)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        UIView.animate(withDuration: 2.0) {
            self.layoutIfNeeded()
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        constructHierarchy()
        activateConstraints()
    }
    
    func wireTopView() {
        mapTopView.addSubview(topViewContainerStack)
        addSubview(mapTopView)
        topViewContainerStack.snp.makeConstraints { make in
            make.edges.equalTo(mapTopView).inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        mapTopView.snp.makeConstraints { make in
            make.width.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.2)
            make.bottom.equalTo(self).multipliedBy(-0.2)
        }
        
        mapTopView.layoutIfNeeded()
        mapTopView.snp.makeConstraints { make in
            make.bottom.equalTo(self).multipliedBy(0.2)
        }
        suggestBtnBottomConstraintToSV?.activate()
        settingsBtnBottomConstraintToSV?.activate()
        suggestBtnBottomConstraintToSV?.update(offset: -30)
        settingsBtnBottomConstraintToSV?.update(offset: -30)
        settingsButton.isHidden = false
        suggestButton.backgroundColor = .mainColor
        suggestButton.setTitle("Suggest Another", for: .normal)
        suggestButton.setTitleColor(.white, for: .normal)
        settingsButton.setTitleColor(.white, for: .normal)
        settingsButton.backgroundColor = .mainColor
        
        UIView.animate(withDuration: 0.8) {
            self.mapTopView.layoutIfNeeded()
            self.layoutIfNeeded()
        }
    }
    
    func constructHierarchy() {
        addSubview(mapView)
        mapView.addSubview(gradientView)
        constructLaunchViewHierarchy()
    }
    
    func activateConstraints() {
        mapView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.edges.equalTo(self)
        }
        gradientView.snp.makeConstraints { make in
            make.center.equalTo(mapView)
            make.edges.equalTo(mapView)
        }
        activateLaunchViewConstraints()
        animateLaunchViewConstraints()
    }
}

class GradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        gradientView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientView()
    }
    
    func gradientView() {
        let gradient = self.layer as! CAGradientLayer
        gradient.colors = [UIColor.mainColor.withAlphaComponent(0.5).cgColor, UIColor.mainDarkColor.withAlphaComponent(1.0).cgColor]
        gradient.frame = self.bounds
        backgroundColor = UIColor.clear
    }
}
