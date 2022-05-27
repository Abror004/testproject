# soundtest

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Jamshid ####, [19.05.2022 15:27]
import UIKit
import AVFoundation
import AudioToolbox

class KeyboardViewController: UIInputViewController {
    
    var player:AVAudioPlayer?
    var cases: Cases = Cases.Latter

    @IBOutlet var nextKeyboardButton: UIButton!
    
    
   
     
    var index:[Int] = [0,0,0,0,0,0]
    
    private weak var _heightConstraint: NSLayoutConstraint?

       override func viewWillAppear(_ animated: Bool)
       {
           super.viewWillAppear(animated)

           guard nil == _heightConstraint else { return }

           // We must add a subview with an `instrinsicContentSize` that uses autolayout to force the height constraint to be recognized.
           //
           let emptyView = UILabel(frame: .zero)
           emptyView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(emptyView);

           let heightConstraint = NSLayoutConstraint(item: view,
                                                     attribute: .height,
                                                      relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 0.0,
                                                     constant: 320)
           heightConstraint.priority = .required - 1
           view.addConstraint(heightConstraint)
           _heightConstraint = heightConstraint
       }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    
    @IBAction func onKey(key:UIButton ){
        
      AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        var label = key.titleLabel?.text as! String
        
        
        switch label {
        case "Delete":
            setSound(url:  Bundle.main.url(forResource: "delete", withExtension: "mp3")!)
            (textDocumentProxy as UIKeyInput).deleteBackward()
            makeZero()
        case "1":
            setSound(url:  Bundle.main.url(forResource: "one", withExtension: "mp3")!)
            index[0] = 1;
        case "2":
            setSound(url:  Bundle.main.url(forResource: "2", withExtension: "mp3")!)
            index[1] = 2
        case "3":
            setSound(url:  Bundle.main.url(forResource: "tree", withExtension: "mp3")!)
            index[2] = 3
        case "4":
            setSound(url:  Bundle.main.url(forResource: "fo", withExtension: "mp3")!)
            index[3] = 4
        case "5":
            setSound(url:  Bundle.main.url(forResource: "five", withExtension: "mp3")!)
            index[4] = 5
        case "6":
            setSound(url:  Bundle.main.url(forResource: "six", withExtension: "mp3")!)
            index[5] = 6
        case "012..":
            cases = Cases.Number
            setSound(url:  Bundle.main.url(forResource: "number", withExtension: "mp3")!)
        case "Lat-Up":
            
            switch cases{
            case Cases.Latter:
                cases = Cases.Upper
                setSound(url:  Bundle.main.url(forResource: "upper", withExtension: "mp3")!)
            case Cases.Upper:
                cases = Cases.Latter
                setSound(url:  Bundle.main.url(forResource: "latter", withExtension: "mp3")!)
            default :
                cases = Cases.Latter
                setSound(url:  Bundle.main.url(forResource: "latter", withExtension: "mp3")!)
                
            }
           
        case "Space":
            switch index {
            case [1,0,0,0,0,0]:
                if cases == Cases.Latter{
                    setSound(url:  Bundle.main.url(forResource: "a", withExtension: "mp3")!)
                    (textDocumentProxy as UIKeyInput).insertText("a")
                }else if cases == Cases.Number{
                    setSound(url:  Bundle.main.url(forResource: "one", withExtension: "mp3")!)
