//
//  OSDrawerController.swift
//  OSDrawerControllerSample
//
//  Created by Ossey on 16/08/2017.
//  Copyright © 2017 Ossey. All rights reserved.
//

import UIKit

class OSDrawerController: UIViewController {
    
    // MARK: - 允许滑动切换控制器的边距类型
    enum OSDrawerControllerPanEdgeType: Int {
        case edge = 0 // 默认左侧和右侧为20的边距允许滑动
        case everyWhere = 1 // 左右两侧滑动无边距
    }
    
    enum OSDrawerControllerType: Int {
        case scale = 0
        case slip = 1
    }
    
    enum OSDrawerStatusBarStyle: Int {
        case hidden = 0
        case black = 1
        case light = 2
    }
    
    fileprivate enum OSDrawer: Int {
        case left = 0
        case right = 1
    }
    
    struct ContentViewShadow {
        var enabled: Bool = true
        var color: UIColor = UIColor.black
        var offset: CGSize = CGSize.zero
        var opacity: Float = 0.4
        var radius: Float = 8.0
        
        init(enabled: Bool = true,
             color: UIColor = .black,
             offset: CGSize = .zero,
             opacity: Float = 0.4,
             radius: Float = 8.0) {
            self.enabled = false
            self.color = color
            self.offset = offset
            self.opacity = opacity
            self.radius = radius
        }
        
    }
    
    struct MenuViewEffect {
        var fade: Bool = true
        var scale: Bool = true
        var scaleBackground: Bool = true
        var parallaxEnabled: Bool = true
        var bouncesHorizontally: Bool = true
        var statusBarStyle: OSDrawerStatusBarStyle = .black
        
        init(fade: Bool = true,
             scale: Bool = true,
             scaleBackground: Bool = true,
             parallaxEnabled: Bool = true,
             bouncesHorizontally: Bool = true,
             statusBarStyle: OSDrawerStatusBarStyle = .black) {
            self.fade = fade
            self.scale = scale
            self.scaleBackground = scaleBackground
            self.parallaxEnabled = parallaxEnabled
            self.bouncesHorizontally = bouncesHorizontally
            self.statusBarStyle = statusBarStyle
        }
    }
    
    struct ContentViewEffect {
        var alpha: Float = 1.0
        var scale: Float = 0.7
        var landscapeOffsetX: Float = 30
        var portraitOffsetX: Float = 30
        var minParallaxContentRelativeValue: Float = -25.0
        var maxParallaxContentRelativeValue: Float = -25.0
        var interactivePopGestureRecognizerEnabled: Bool = true
        init(alpha: Float = 1.0,
             scale: Float = 0.7,
             landscapeOffsetX: Float = 30,
             portraitOffsetX: Float = 30,
             minParallaxContentRelativeValue: Float = -25.0,
             maxParallaxContentRelativeValue: Float = -25.0,
             interactivePopGestureRecognizerEnabled: Bool = true) {
            self.alpha = alpha
            self.scale = scale
            self.landscapeOffsetX = landscapeOffsetX
            self.portraitOffsetX = portraitOffsetX
            self.minParallaxContentRelativeValue = minParallaxContentRelativeValue
            self.maxParallaxContentRelativeValue = maxParallaxContentRelativeValue
        }
        
    }
    
    struct OSDrawerOptions {
        var animationDuration: Float = 0.35
        var panGestureEnabled: Bool = true
        var panEdgeType: OSDrawerControllerPanEdgeType = .edge
        var type: OSDrawerControllerType = .scale
        var panMinimumOpenThreshold: UInt = 60
        var menuViewControllerTransformation: CGAffineTransform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        var backgroundTransformation: CGAffineTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        var endAllEditing: Bool = false
        
        init(animationDuration: Float = 0.35, panGestureEnabled: Bool = true, panEdgeType: OSDrawerControllerPanEdgeType = .edge, type: OSDrawerControllerType = .scale, panMinimumOpenThreshold: UInt = 60, menuViewControllerTransformation: CGAffineTransform = CGAffineTransform.init(scaleX: 1.5, y: 1.5), backgroundTransformation: CGAffineTransform = CGAffineTransform(scaleX: 1.5, y: 1.5), endAllEditing: Bool = false) {
            self.animationDuration = animationDuration
            self.panGestureEnabled = panGestureEnabled
            self.panEdgeType = panEdgeType
            self.type = type
            self.panMinimumOpenThreshold = panMinimumOpenThreshold
            self.menuViewControllerTransformation = menuViewControllerTransformation
            self.backgroundTransformation = backgroundTransformation
            self.endAllEditing = endAllEditing
        }
        
    }
    
    // MARK: - config
    
    func configure(_ configuration: MenuViewEffect) -> Void {
        
    }
    
    func configure(_ configuration: ContentViewEffect) -> Void {
        
    }
    
    func configure(_ configuration: ContentViewShadow) -> Void {
        
    }
    
    func configure(_ configuration: OSDrawerOptions) -> Void {
        
    }
    
    // MARK: - Storyboard Support
    @IBInspectable var contentViewStoryboardId: String?
    @IBInspectable var leftMenuViewStoryboardId: String?
    @IBInspectable var rightMenuViewStoryboardId: String?
    
    // MARK: - Private properties: MenuView & BackgroundImageView
    @IBInspectable var fadeMenuView: Bool = true
    @IBInspectable var scaleMenuView: Bool = true
    @IBInspectable var scaleBackgroundImageView = true
    @IBInspectable var parallaxEnabled: Bool = false
    @IBInspectable var bouncesHorizontally: Bool = true
    
    // MARK: - Public properties: MenuView
    @IBInspectable var statusBarStyle: OSDrawerStatusBarStyle = .black
    
    // MARK: - Private properties: ContentView
    @IBInspectable var contentViewScaleValue: Float = 0.7
    @IBInspectable var contentViewFadeOutAlpha: Float = 1.0
    @IBInspectable var contentViewInLandscapeOffsetCenterX: Float = 30.0
    @IBInspectable var contentViewInPortraitOffsetCenterX: Float = 30.0
    @IBInspectable var parallaxContentMinimumRelativeValue: Float = -25.0
    @IBInspectable var parallaxContentMaximumRelativeValue: Float = 25.0
    
    // MARK: - Public properties: ContentView
    @IBInspectable var interactivePopGestureRecognizerEnabled: Bool = true
    @IBInspectable var endAllEditing: Bool = false
    
    // MARK: - Private properties: shadow for ContentView
    @IBInspectable var contentViewShadowEnabled: Bool = true
    @IBInspectable var contentViewShadowColor: UIColor = .black
    @IBInspectable var contentViewShadowOffset: CGSize = .zero
    @IBInspectable var contentViewShadowOpacity: Float = 0.4
    @IBInspectable var contentViewShadowRadius: Float = 8.0
    
    
    /* ====================================================================== */
    // MARK: - initializer
    /* ====================================================================== */
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /* ====================================================================== */
    // MARK: - view life
    /* ====================================================================== */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
