//
//  SuggestionView.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit
import SnapKit
import MapKit
import NVActivityIndicatorView

enum SuggestStatus {
    case firstTime
    case anotherOne
}

class SuggestionView: BaseView {
    let viewModel: SuggestionViewModel
    var status: SuggestStatus = .firstTime
    
    init(frame: CGRect = .zero,
         viewModel: SuggestionViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    //MARK: - Resturant Icon Constraints
    var resturantIconCenterConstraint: Constraint?
    //MARK: - wainNakel label Constraints
    var wainNakelLblBottomConstraintToSV: Constraint?
    var wainNakelLblTopConstraintToLaunchView: Constraint?
    var wainNakelLblCenterXConstraint: Constraint?
    //MARK: - Suggest Button Constraints
    var suggestBtnTrailingToSVConstraint: Constraint?
    var suggestBtnBottomToSVConstraint: Constraint?
    var suggestBtnBottmToLblContraint: Constraint?
    var suggestBtnToSettingBtnConstraint: Constraint?
    var suggestBtnWidthConstraint: Constraint?
    var suggestBtnHeightConstraint: Constraint?
    var suggestBtnCenterToSVConstraint: Constraint?
    //MARK: - Settings Button Constraints
    var settingsBtnBottomToSVConstraint: Constraint?
    var settingsBtnBottmToLblContraint: Constraint?
    var settingsBtnLeadingToSVContraint: Constraint?
    var settingsBtnWidthConstraint: Constraint?
    var settingsBtnHeightConstraint: Constraint?
    var settingsBtnTosuggestBtnConstraint: Constraint?
    //MARK: - Top White View Constraints
    var topWhiteViewHeightContraints: Constraint?
    //MARK: - Gradient Launch View Constraints
    var launchViewTopContraint: Constraint?
    var launchViewBottomContraint: Constraint?
    var launchViewLeadingContraint: Constraint?
    var launchViewTrailingContraint: Constraint?
    var launchViewHeightContraint: Constraint?
    //MARK: - Map View
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
    //MARK: - Gradient View
    let gradientView: UIView = {
        return GradientView()
    }()
    //MARK: - Top White View
    let TopWhiteView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        return view
    }()
    //MARK: - Top White View Container Stack
    lazy var TopWhiteViewContainerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [resturantNameLabel, mapTopViewBtnsStack])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
    //MARK: - Top Launch View Container Stack
    lazy var LaunchViewContainerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [refreshButton, LaunchViewTitleIconStack, menuButton])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    //MARK: - Top Launch View Container Stack
    lazy var LaunchViewTitleIconStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [wainNakelLabel, resturantIcon])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    //MARK: - resturant Name Label
    let resturantNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainColor
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.text = "Failed"
        return label
    }()
    //MARK: - Map Top View Buttons Stack
    let mapTopViewBtnsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [UIImageView(image: #imageLiteral(resourceName: "map")), UIImageView(image: #imageLiteral(resourceName: "gallery")), UIImageView(image: #imageLiteral(resourceName: "favorite")), UIImageView(image: #imageLiteral(resourceName: "share"))])
        stack.axis = .horizontal
        stack.spacing = 30
        stack.distribution = .equalCentering
        return stack
    }()
    //MARK: - (Blue View) Refresh Button
    let refreshButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("", for: .disabled)
        button.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        button.layer.cornerRadius = button.frame.size.width / 2
        return button
    }()
    //MARK: (Menu Button) 
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("", for: .disabled)
        button.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        button.layer.cornerRadius = button.frame.size.width / 2
        button.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        return button
    }()
    //MARK: - Suggest Button
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
    //MARK: - Launch View Components
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
    //MARK: -
    @objc func suggestButtonTapped() {
        switch status {
        case .firstTime:
            suggestButtonFirstTimeTapped()
            status = .anotherOne
        case .anotherOne:
            if let viewModel = viewModel as? DefaultSuggestionViewModel {
                viewModel.suggestResturant()
            }
        }
    }
    
    fileprivate func suggestButtonFirstTimeTapped() {
        suggestButton.addSubview(activityIndicatorView)
        suggestButton.setTitle("", for: .normal)
        activityIndicatorView.snp.makeConstraints { make in
            make.edges.equalTo(suggestButton)
            make.center.equalTo(suggestButton)
        }
        activityIndicatorView.startAnimating()
        animateConstraintAfterSuggestBtnTapped()
    }
    
    fileprivate func animateConstraintAfterSuggestBtnTapped() {
        self.suggestBtnWidthConstraint?.update(offset: 200)
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
            self.animateLaunchViewToTopContraints()
            self.activateTopWhiteViewContraints()
        }
    }
    
    fileprivate func animateLaunchViewToTopContraints() {
        self.layoutIfNeeded()
        wainNakelLblBottomConstraintToSV?.deactivate()
        resturantIconCenterConstraint?.deactivate()
        gradientView.addSubview(LaunchViewContainerStack)
        LaunchViewContainerStack.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.leading.trailing.equalToSuperview().offset(16)
            make.top.equalTo(44)
            make.bottom.equalToSuperview()
        }
        gradientView.snp.updateConstraints { make in
            self.launchViewBottomContraint?.deactivate()
            self.launchViewHeightContraint?.activate()
        }
        self.activateTopWhiteViewContraints()
        
        UIView.animate(withDuration: 0.8) {
            self.layoutIfNeeded()
        }
    }
    
    func constructLaunchViewHierarchy() {
        self.addSubview(resturantIcon)
        self.addSubview(wainNakelLabel)
        self.addSubview(suggestButton)
        self.addSubview(settingsButton)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        constructHierarchy()
        activateConstraints()
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
            self.launchViewTopContraint = make.top.equalToSuperview().constraint
            self.launchViewBottomContraint = make.bottom.equalToSuperview().constraint
            self.launchViewLeadingContraint = make.leading.equalToSuperview().constraint
            self.launchViewTrailingContraint = make.trailing.equalToSuperview().constraint
            self.launchViewHeightContraint = make.height.equalTo(80).constraint
            self.launchViewHeightContraint?.deactivate()
        }
        activateLaunchViewConstraints()
        animateLaunchViewConstraints()
    }
}
