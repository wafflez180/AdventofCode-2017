//
//  ViewController.swift
//  AdventDay6
//
//  Created by Arthur De Araujo on 12/5/17.
//  Copyright © 2017 Arthur De Araujo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var banks = [0,5,10,0,11,14,13,4,11,8,8,7,1,4,12,11]//[0,2,7,0]//
    var beforeState = -1
    var finalState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adventDay6()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func adventDay6(){
        var counter = 0
        var checkList:[[Int]] = []
        while containsTwoMatchingLists(checkList: checkList, counter: counter) == false {
            //print(checkList)
            //print(banks)
            var largest = banks[0]
            var largestIndex = 0
            for index in 0..<banks.count {
                var bank:Int = banks[index]
                if bank > largest {
                    largest = bank
                    largestIndex = index
                }
            }
            banks[largestIndex] = 0
            //print(banks)
            var indexToChange = largestIndex
            // Got largest
            var amountToDistribute = Int(ceil(Double(largest) / Double(banks.count)))
            //print(largest)
            //print(amountToDistribute)
            
            for index in 0..<banks.count {
                indexToChange+=1
                if indexToChange >= banks.count {
                    indexToChange = 0
                }
                
                var bank:Int = banks[indexToChange]
                if largest < amountToDistribute {
                    //print(bank)
                    if largest > 0 {
                        banks[indexToChange] = bank+largest
                    }
                }else{
                    banks[indexToChange] = bank+amountToDistribute
                }
                largest-=amountToDistribute
                //print(banks)
                //print(largest)
            }
            checkList.append(banks)
            counter+=1
        }
        print(counter)
    }
    
    func containsTwo(checkList:[[Int]], list:[Int],counter:Int) -> Bool {
        var foundOne = false
        for index in 0..<checkList.count {
            if checkList[index] == list && foundOne == true {
                print(counter)
                print(counter-beforeState)
                return true
            } else if checkList[index] == list {
                if beforeState == -1 {
                    beforeState = counter
                    print(beforeState)
                }
                foundOne = true
            }
        }
        return false
    }
    
    func containsTwoMatchingLists(checkList:[[Int]],counter:Int) -> Bool {
        //print(counter)
        var foundOne = false
        for index in 0..<checkList.count {
            var list1 = checkList[index]
            for index2 in 0..<checkList.count {
                var list2 = checkList[index2]
                if list1 == list2 && index != index2 {
                    print(index2-index)
                    return true
                }
            }
        }
        return false
    }
}

