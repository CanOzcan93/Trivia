//
//  SplashLayout-Main.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class SplashLayout: TRLayout {
        
        private var tv_loading: TRTextView!
        private var iv_logo: TRImageView!
//        public var btn_start: TRButton!

        /*
         -
         -
         // MARK: Construction
         -
         -
         */

        public override func onConstruct() {

            super.onConstruct()

            self.applyBackgroundGradient(colors: [
                colorProvider.getNormalBlue().cgColor,
                colorProvider.getNormalBlue().cgColor,
                colorProvider.getLightBlue().cgColor,
                colorProvider.getWhiteFull().cgColor
            ], rect: self.bounds,isHorizontal: false)

            constructLoadingTextView()
            constructLogoImageView()

        }

        private func constructLogoImageView() {

            iv_logo = TRImageView()
            iv_logo.image = imageProvider.getLogo()
            self.addSubview(iv_logo)

        }

        private func constructLoadingTextView() {

            tv_loading = TRTextView()
            tv_loading.text = "Finding a Room..."
            tv_loading.textAlignment = .center
            tv_loading.font = fontProvider.getSemiboldBiggest()
            tv_loading.textColor = self.colorProvider.getDarkGray()
            tv_loading.alpha = 0
            self.addSubview(tv_loading)
            
            UIView.animate(withDuration: 1.0, delay: 2, options: [.repeat,.autoreverse], animations: {
                self.tv_loading.alpha = 1
            }, completion: nil)

        }

        /*
         -
         -
         // MARK: Constraining
         -
         -
         */

        public override func onConstrain(set: inout [NSLayoutConstraint]) {

            super.onConstrain(set: &set)

            constrainLogoImageView(set: &set)
            constrainLoadingTextView(set: &set)

        }

        private func constrainLogoImageView(set: inout [NSLayoutConstraint]) {
            
            let hiddenShadeConstraint = NSLayoutConstraint(item: iv_logo, attribute: .left, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
            let visibleShadeConstraint = NSLayoutConstraint(item: iv_logo, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
            
            set.append(hiddenShadeConstraint)
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .height, relatedBy: .equal, toItem: iv_logo, attribute: .width, multiplier: 0.5, constant: 0))
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                UIView.animate(withDuration: 1) {
                    self.shift(from: hiddenShadeConstraint, to: visibleShadeConstraint)
                    self.relayout()
                }
            }
            
            

        }

        private func constrainLoadingTextView(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: tv_loading, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_loading, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -40))
            set.append(NSLayoutConstraint(item: tv_loading, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: tv_loading, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))

        }
        
    }
    
}
