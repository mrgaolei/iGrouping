//
//  WPGConfigViewController.swift
//  iGrouping
//
//  Created by 高磊 on 15/2/7.
//
//

import UIKit

class WPGConfigViewController: UIViewController {
    
    var perGroup: NSInteger = 0
    var groupCount: NSInteger = 0

    @IBOutlet var label_preGroup: UILabel!
    @IBOutlet var label_groupCount: UILabel!
    @IBOutlet var label_sum: UILabel!
    
    @IBAction func modify_perGroup(sender: UIStepper) {
        perGroup = NSInteger(sender.value)
        updateLabelValue()
    }
    
    @IBAction func modify_groupCount(sender: UIStepper) {
        groupCount = NSInteger(sender.value)
        updateLabelValue()
    }
    
    func updateLabelValue() {
        label_preGroup.text = "\(perGroup)"
        label_groupCount.text = "\(groupCount)"
        let sum: NSInteger = perGroup * groupCount
        label_sum.text = "总人数：\(sum)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        perGroup = 2;
        groupCount = 3;
        updateLabelValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.destinationViewController.isMemberOfClass(WPGGroupViewController.classForCoder())) {
            let qian: NSMutableArray = NSMutableArray()
            let words: NSArray = NSArray(objects: "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
            for i in 0...groupCount-1 {
                for j in 0...perGroup-1 {
                    qian.addObject(words.objectAtIndex(i))
                }
            }
            let vc: WPGGroupViewController = segue.destinationViewController as! WPGGroupViewController
            vc.qian = qian.shuffledArray()
        }
    }

}
