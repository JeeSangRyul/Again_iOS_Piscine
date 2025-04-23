//
//  ViewController.swift
//  ex04
//
//  Created by 지상률 on 2023/07/30.
//

import UIKit
import FlexLayout
import PinLayout
import RxSwift
import Then
import ReactorKit

class ViewController: UIViewController, View {
    typealias Reactor = CalculatorReactor
    
    var disposeBag = DisposeBag()
    
    private var container = UIView()
    
    //number text
    private let numberLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = UIColor.white
        $0.textAlignment = .right
        $0.font = UIFont.systemFont(ofSize: 48, weight: .light)
    }
    
    //number pad
    private let oneButton = UIButton().then {
        $0.setTitle("1", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let twoButton = UIButton().then {
        $0.setTitle("2", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let threeButton = UIButton().then {
        $0.setTitle("3", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let fourButton = UIButton().then {
        $0.setTitle("4", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let fiveButton = UIButton().then {
        $0.setTitle("5", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let sixButton = UIButton().then {
        $0.setTitle("6", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let sevenButton = UIButton().then {
        $0.setTitle("7", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let eightButton = UIButton().then {
        $0.setTitle("8", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let nineButton = UIButton().then {
        $0.setTitle("9", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let zeroButton = UIButton().then {
        $0.setTitle("0", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let firstEmptyPad = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let secondEmptyPad = UIView().then {
        $0.backgroundColor = .clear
    }
    
    //calculate pad
    private let acButton = UIButton().then {
        $0.setTitle("AC", for: .normal)
        $0.backgroundColor = .lightGray
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let negButton = UIButton().then {
        $0.setTitle("NEG", for: .normal)
        $0.backgroundColor = .lightGray
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let sumButton = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let multiplyButton = UIButton().then {
        $0.setTitle("*", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let subtractionButton = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let divideButton = UIButton().then {
        $0.setTitle("/", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let resultButton = UIButton().then {
        $0.setTitle("=", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 28)
    }
    
    private let thirdEmptyPad = UIView().then {
        $0.backgroundColor = .clear
    }
    
    func bind(reactor: Reactor) {
        oneButton.rx.tap
             .map { Reactor.Action.tapNumber(1) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         twoButton.rx.tap
             .map { Reactor.Action.tapNumber(2) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         threeButton.rx.tap
             .map { Reactor.Action.tapNumber(3) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         fourButton.rx.tap
             .map { Reactor.Action.tapNumber(4) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         fiveButton.rx.tap
             .map { Reactor.Action.tapNumber(5) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         sixButton.rx.tap
             .map { Reactor.Action.tapNumber(6) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         sevenButton.rx.tap
             .map { Reactor.Action.tapNumber(7) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         eightButton.rx.tap
             .map { Reactor.Action.tapNumber(8) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         nineButton.rx.tap
             .map { Reactor.Action.tapNumber(9) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         zeroButton.rx.tap
             .map { Reactor.Action.tapNumber(0) }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         sumButton.rx.tap
             .map { Reactor.Action.tapOperator("+") }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         subtractionButton.rx.tap
             .map { Reactor.Action.tapOperator("-") }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         multiplyButton.rx.tap
             .map { Reactor.Action.tapOperator("*") }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         divideButton.rx.tap
             .map { Reactor.Action.tapOperator("/") }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         resultButton.rx.tap
             .map { Reactor.Action.tapEqual }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         acButton.rx.tap
             .map { Reactor.Action.tapAC }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         negButton.rx.tap
             .map { Reactor.Action.tapNEG }
             .bind(to: reactor.action)
             .disposed(by: disposeBag)
         
         reactor.state
             .map { $0.displayText }
             .distinctUntilChanged()
             .bind(to: numberLabel.rx.text)
             .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(container)
        let reactor = CalculatorReactor()
        self.reactor = reactor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        container.pin.all(view.safeAreaInsets)
        container.flex.markDirty()
        let keypadHeight = view.bounds.height * 0.7
        let keypadWidth = view.bounds.width / 4
        setupLayout(keypadHeight: keypadHeight, keypadWidth: keypadWidth)
        container.flex.layout()
    }
    
    private func setupLayout(keypadHeight: CGFloat, keypadWidth: CGFloat) {
        container.flex.direction(.column).define { flex in
            flex.addItem(numberLabel)
                .marginHorizontal(20)
                .marginBottom(20)
                .alignSelf(.end)
                .grow(1)
                .width(100%)
            
            flex.addItem().define { buttonContainer in
                buttonContainer.direction(.column).define { keypad in
                    keypad.addItem().direction(.row).define { row in
                        row.addItem(acButton).width(keypadWidth)
                        row.addItem(negButton).width(keypadWidth)
                        row.addItem(divideButton).width(keypadWidth)
                        row.addItem(multiplyButton).width(keypadWidth)
                    }.grow(1).width(100%)
                    
                    keypad.addItem().direction(.row).define { row in
                        row.addItem(sevenButton).width(keypadWidth)
                        row.addItem(eightButton).width(keypadWidth)
                        row.addItem(nineButton).width(keypadWidth)
                        row.addItem(subtractionButton).width(keypadWidth)
                    }.grow(1).width(100%)
                    
                    keypad.addItem().direction(.row).define { row in
                        row.addItem(fourButton).width(keypadWidth)
                        row.addItem(fiveButton).width(keypadWidth)
                        row.addItem(sixButton).width(keypadWidth)
                        row.addItem(sumButton).width(keypadWidth)
                    }.grow(1).width(100%)
                    
                    keypad.addItem().direction(.row).define { row in
                        row.addItem(oneButton).width(keypadWidth)
                        row.addItem(twoButton).width(keypadWidth)
                        row.addItem(threeButton).width(keypadWidth)
                        row.addItem(resultButton).width(keypadWidth)
                    }.grow(1).width(100%)
                    
                    keypad.addItem().direction(.row).define { row in
                        row.addItem(zeroButton).width(keypadWidth * 2)
                        row.addItem(firstEmptyPad).width(keypadWidth)
                        row.addItem(secondEmptyPad).width(keypadWidth)
                    }.grow(1).width(100%)
                }
            }
            .height(keypadHeight)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { _ in
            self.view.layoutIfNeeded()
        }
    }
}
