//
//  QuestionsLayout-Main.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class QuestionsLayout: TRLayout {
        
        private var tv_question_header: TRTextView!
        private var tv_question_value: TRTextView!
        
        private var tv_wild_header: TRTextView!
        private var tv_wild_value: TRTextView!
        
        private var tv_header: TRTextView!
        
        private var v_background_question: TRView!
        private var tv_question: TRTextView!
        
        private var btn_first: TRButton!
        private var btn_second: TRButton!
        private var btn_third: TRButton!
        private var btn_fourth: TRButton!
        
        private var popup_wildcard: WildCardPopup!

        public override func onConstruct() {

            super.onConstruct()

            self.applyBackgroundGradient(colors: [
                colorProvider.getNormalBlue().cgColor,
                colorProvider.getNormalBlue().cgColor,
                colorProvider.getLightBlue().cgColor,
                colorProvider.getWhiteFull().cgColor
            ], rect: self.bounds,isHorizontal: false)

            constructQuestionHeaderTextView()
            constructQuestionValueTextView()
            constructWildCardHeaderTextView()
            constructWildCardValueTextView()
            constructHeaderTextView()
            constructQuestionBackgroundView()
            constructQuestionTextView()
            constructFirstButton()
            constructSecondButton()
            constructThirdButton()
            constructFourthButton()

            constructWildCardPopup()
        }
        


        private func constructQuestionHeaderTextView() {

            tv_question_header = TRTextView()
            tv_question_header.text = "Question Num"
            tv_question_header.textAlignment = .center
            tv_question_header.textColor = colorProvider.getWhiteFull()
            self.addSubview(tv_question_header)

        }
        
        private func constructQuestionValueTextView() {

            tv_question_value = TRTextView()
            tv_question_value.text = "1/12"
            tv_question_value.textAlignment = .center
            tv_question_value.textColor = colorProvider.getWhiteFull()
            self.addSubview(tv_question_value)

        }
        
        private func constructWildCardHeaderTextView() {

            tv_wild_header = TRTextView()
            tv_wild_header.text = "Wild Card Num"
            tv_wild_header.textAlignment = .center
            tv_wild_header.textColor = colorProvider.getWhiteFull()
            self.addSubview(tv_wild_header)

        }
        
        private func constructWildCardValueTextView() {

            tv_wild_value = TRTextView()
            tv_wild_value.text = "3"
            tv_wild_value.textAlignment = .center
            tv_wild_value.textColor = colorProvider.getWhiteFull()
            self.addSubview(tv_wild_value)

        }
        
        private func constructHeaderTextView() {

            tv_header = TRTextView()
            tv_header.text = "Question"
            tv_header.textAlignment = .center
            tv_header.textColor = colorProvider.getWhiteFull()
            self.addSubview(tv_header)

        }
        
        private func constructQuestionTextView() {

            tv_question = TRTextView()
            tv_question.text = "What is the chemical formula for water?"
            tv_question.numberOfLines = 0
            tv_question.textAlignment = .center
            tv_question.textColor = colorProvider.getDarkGray()
            self.addSubview(tv_question)

       }
        
        private func constructQuestionBackgroundView() {

            v_background_question = TRView()
            v_background_question.backgroundColor = colorProvider.getWhiteFull()
            self.addSubview(v_background_question)

        }
        
        private func constructFirstButton() {

            btn_first = TRButton()
            btn_first.setTitle("CO2", for: .normal)
            btn_first.setTitleColor(colorProvider.getBlackFull(), for: .normal)
            btn_first.backgroundColor = colorProvider.getWhiteFull()
            self.addSubview(btn_first)

        }
        
        private func constructSecondButton() {

            btn_second = TRButton()
            btn_second.setTitle("H2O", for: .normal)
            btn_second.setTitleColor(colorProvider.getBlackFull(), for: .normal)
            btn_second.backgroundColor = colorProvider.getWhiteFull()
            self.addSubview(btn_second)

        }
        
        private func constructThirdButton() {

            btn_third = TRButton()
            btn_third.setTitle("C2H5O", for: .normal)
            btn_third.setTitleColor(colorProvider.getBlackFull(), for: .normal)
            btn_third.backgroundColor = colorProvider.getWhiteFull()
            self.addSubview(btn_third)

        }
        
        private func constructFourthButton() {

            btn_fourth = TRButton()
            btn_fourth.setTitle("H2N", for: .normal)
            btn_fourth.setTitleColor(colorProvider.getBlackFull(), for: .normal)
            btn_fourth.backgroundColor = colorProvider.getWhiteFull()
            self.addSubview(btn_fourth)

        }
        
        private func constructWildCardPopup() {

            popup_wildcard = WildCardPopup(layout: self)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.popup_wildcard.show()
            }

        }
        
        public override func onConstrain(set: inout [NSLayoutConstraint]) {

            super.onConstrain(set: &set)

            constrainQuestionHeaderTextView(set: &set)
            constrainQuestionValueTextView(set: &set)
            constrainWildCardHeaderTextView(set: &set)
            constrainWildCardValueTextView(set: &set)
            constrainHeaderTextView(set: &set)
            constrainQuestionTextView(set: &set)
            constrainQuestionBackgroundView(set: &set)
            constrainFirstButton(set: &set)
            constrainSecondButton(set: &set)
            constrainThirdButton(set: &set)
            constrainFourthButton(set: &set)
            
        }
        
        private func constrainQuestionHeaderTextView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: tv_question_header, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: tv_question_header, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 40))
            set.append(NSLayoutConstraint(item: tv_question_header, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: -40))
            set.append(NSLayoutConstraint(item: tv_question_header, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))

        }
        
        private func constrainQuestionValueTextView(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: tv_question_value, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: tv_question_value, attribute: .top, relatedBy: .equal, toItem: tv_question_header, attribute: .bottom, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_question_value, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: -40))
            set.append(NSLayoutConstraint(item: tv_question_value, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))

        }
        
        private func constrainWildCardHeaderTextView(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: tv_wild_header, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20))
            set.append(NSLayoutConstraint(item: tv_wild_header, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 40))
            set.append(NSLayoutConstraint(item: tv_wild_header, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: -40))
            set.append(NSLayoutConstraint(item: tv_wild_header, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))

        }
        
        private func constrainWildCardValueTextView(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: tv_wild_value, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20))
            set.append(NSLayoutConstraint(item: tv_wild_value, attribute: .top, relatedBy: .equal, toItem: tv_wild_header, attribute: .bottom, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_wild_value, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: -40))
            set.append(NSLayoutConstraint(item: tv_wild_value, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))

        }
        
        private func constrainHeaderTextView(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: tv_header, attribute: .left, relatedBy: .equal, toItem: tv_question_header, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .right, relatedBy: .equal, toItem: tv_wild_header, attribute: .right, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .top, relatedBy: .equal, toItem: tv_question_value, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))

        }
        
        private func constrainQuestionBackgroundView(set: inout [NSLayoutConstraint]) {

             set.append(NSLayoutConstraint(item: v_background_question, attribute: .left, relatedBy: .equal, toItem: tv_question, attribute: .left, multiplier: 1, constant: -10))
             set.append(NSLayoutConstraint(item: v_background_question, attribute: .right, relatedBy: .equal, toItem: tv_question, attribute: .right, multiplier: 1, constant: 10))
             set.append(NSLayoutConstraint(item: v_background_question, attribute: .top, relatedBy: .equal, toItem: tv_question, attribute: .top, multiplier: 1, constant: -10))
             set.append(NSLayoutConstraint(item: v_background_question, attribute: .bottom, relatedBy: .equal, toItem: tv_question, attribute: .bottom, multiplier: 1, constant: 10))


        }
        
        private func constrainQuestionTextView(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: tv_question, attribute: .left, relatedBy: .equal, toItem: tv_header, attribute: .left, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: tv_question, attribute: .right, relatedBy: .equal, toItem: tv_header, attribute: .right, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: tv_question, attribute: .top, relatedBy: .equal, toItem: tv_header, attribute: .bottom, multiplier: 1, constant: 30))

        }
        
        private func constrainFirstButton(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: btn_first, attribute: .left, relatedBy: .equal, toItem: v_background_question, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_first, attribute: .right, relatedBy: .equal, toItem: v_background_question, attribute: .right, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_first, attribute: .top, relatedBy: .equal, toItem: v_background_question, attribute: .bottom, multiplier: 1, constant: 40))
            set.append(NSLayoutConstraint(item: btn_first, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))

        }
        
        private func constrainSecondButton(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: btn_second, attribute: .left, relatedBy: .equal, toItem: v_background_question, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_second, attribute: .right, relatedBy: .equal, toItem: v_background_question, attribute: .right, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_second, attribute: .top, relatedBy: .equal, toItem: btn_first, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: btn_second, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
            
        }
        
        private func constrainThirdButton(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: btn_third, attribute: .left, relatedBy: .equal, toItem: v_background_question, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_third, attribute: .right, relatedBy: .equal, toItem: v_background_question, attribute: .right, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_third, attribute: .top, relatedBy: .equal, toItem: btn_second, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: btn_third, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))

        }
        
        private func constrainFourthButton(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: btn_fourth, attribute: .left, relatedBy: .equal, toItem: v_background_question, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_fourth, attribute: .right, relatedBy: .equal, toItem: v_background_question, attribute: .right, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_fourth, attribute: .top, relatedBy: .equal, toItem: btn_third, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: btn_fourth, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))

        }
        
        
        private func updateQuestion() {
            
            tv_question.text = "fdsafhsadjkfgjsadkhgfjkhsadgfhjkasdgfhjkasdgfjkkgadsjhkfgsadkhjgfkhjasdgfhjkasdgfkhjsadgfjhksadgfjhasdjhvcsdhjkfgghsdabhcsdabvhjkafbicbaubkbsdfas"
            
        }
        
        public func addFunctionToButtons(act: @escaping Action) {
            
            btn_first.onClick(act)
            btn_second.onClick(act)
            btn_third.onClick(act)
            btn_fourth.onClick(act)
            
        }
        
    }
    
}

