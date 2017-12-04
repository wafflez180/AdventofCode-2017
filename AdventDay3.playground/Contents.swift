//: Playground - noun: a place where people can play

import UIKit

let length = 640

var list:[[Int]] = []

var list2:[Int] = []
for index in 0...length-1 {
    list2.append(index)
}

for index in 0...length-1 {
    //print(index)
    list.append(list2)
}
print("hi")
var startingPointRow = (list.count/2)
var startingPointColumn = (list.count/2)

print(startingPointRow)
print(startingPointColumn)
list[startingPointRow][startingPointColumn] = 1
startingPointColumn+=1
list[startingPointRow][startingPointColumn] = 2

for x in list {
    //print(x)
}
var numCounter = 2

for power in 0...length {
    //print("power: \(power)")
    var moveRightOnce = false
    var placeCounter = 2
    
    for index in 0..<4 {
        var repeatNum = 2*(power+1)
        if index == 0 {
            repeatNum = ((power)*2)+1
        }
        if index == 3 {
            repeatNum+=1
        }
        if power < 4 {
            //print("\nRepeat Num : \(repeatNum)")
        }
        if repeatNum>=0{
            for _ in 0..<repeatNum {
                // Do moves by amount of power (1, twice, three times)
                if(index == 0){
                    startingPointRow-=1
                    if power < 4 {
                        //print("Up")
                    }
                }else if(index == 1){
                    startingPointColumn-=1
                    if power < 4 {
                        //print("Left")
                    }
                }else if(index == 2){
                    startingPointRow+=1
                    if power < 4 {
                        //print("Down")
                    }
                }else if(index == 3){
                    startingPointColumn+=1
                    if power < 4 {
                        //print("Right")
                    }
                }
                if startingPointRow >= 0 && startingPointRow < list.count && startingPointColumn >= 0 && startingPointColumn < list[startingPointRow].count {
                    numCounter+=1
                    list[startingPointRow][(startingPointColumn)] = numCounter
                    if 368078 == numCounter {
                        print("AH Row: \(startingPointRow)")
                        print("AH Column: \(startingPointColumn)")
                    }
                }
                if power < 4 {
                    //print("power: \(power)")
                    //print("index: \(index)")
                    //print("Counter: \(numCounter)")
                    for x in list {
                        //print("\(x)\t\t")
                    }
                }
            }
        }
    }
}

for x in list {
    //print("\(x) \t \t")
}


// PART 2:

/*        let length = 12
 
 var list:[[Int]] = []
 
 var list2:[Int] = []
 for index in 0...length-1 {
 list2.append(0)
 }
 
 for index in 0...length-1 {
 //print(index)
 list.append(list2)
 }
 print("hi")
 var startingPointRow = (list.count/2)
 var startingPointColumn = (list.count/2)
 
 print(startingPointRow)
 print(startingPointColumn)
 list[startingPointRow][startingPointColumn] = 1
 startingPointColumn+=1
 list[startingPointRow][startingPointColumn] = 1
 
 for x in list {
 //print(x)
 }
 var numCounter = 2
 
 var goteem = false
 
 for power in 0...length {
 //print("power: \(power)")
 var moveRightOnce = false
 var placeCounter = 2
 
 for index in 0..<4 {
 var repeatNum = 2*(power+1)
 if index == 0 {
 repeatNum = ((power)*2)+1
 }
 if index == 3 {
 repeatNum+=1
 }
 if power < 4 {
 //print("\nRepeat Num : \(repeatNum)")
 }
 if repeatNum>=0{
 for _ in 0..<repeatNum {
 // Do moves by amount of power (1, twice, three times)
 if(index == 0){
 startingPointRow-=1
 if power < 4 {
 //print("Up")
 }
 }else if(index == 1){
 startingPointColumn-=1
 if power < 4 {
 //print("Left")
 }
 }else if(index == 2){
 startingPointRow+=1
 if power < 4 {
 //print("Down")
 }
 }else if(index == 3){
 startingPointColumn+=1
 if power < 4 {
 //print("Right")
 }
 }
 if startingPointRow >= 0 && startingPointRow < list.count && startingPointColumn >= 0 && startingPointColumn < list[startingPointRow].count {
 numCounter = 0
 
 // Find children and add
 var leftNum = 0
 if startingPointColumn-1 >= 0 {
 leftNum = list[startingPointRow][startingPointColumn-1]
 }
 var rightNum = 0
 if startingPointColumn+1 < list[startingPointRow].count {
 rightNum = list[startingPointRow][startingPointColumn+1]
 }
 var topNum = 0
 if startingPointRow-1 >= 0 {
 topNum = list[startingPointRow-1][startingPointColumn]
 }
 var bottomNum = 0
 if startingPointRow+1 < list.count  {
 bottomNum = list[startingPointRow+1][startingPointColumn]
 }
 var topLeftNum = 0
 if startingPointRow-1 >= 0 && startingPointColumn-1 >= 0 {
 topLeftNum = list[startingPointRow-1][startingPointColumn-1]
 }
 var topRightNum = 0
 if startingPointRow-1 >= 0 && startingPointColumn+1 < list[startingPointRow].count {
 topRightNum = list[startingPointRow-1][startingPointColumn+1]
 }
 var botLeftNum = 0
 if startingPointRow+1 < list.count && startingPointColumn-1 >= 0 {
 botLeftNum = list[startingPointRow+1][startingPointColumn-1]
 }
 var botRightNum = 0
 if startingPointRow+1 < list.count && startingPointColumn+1 < list[startingPointRow].count {
 botRightNum = list[startingPointRow+1][startingPointColumn+1]
 }
 
 numCounter += (leftNum + rightNum + topNum + bottomNum + topLeftNum + topRightNum + botLeftNum + botRightNum)
 
 list[startingPointRow][(startingPointColumn)] = numCounter
 if 368078 < numCounter && goteem == false {
 print("Number: \(numCounter)")
 goteem = true
 print("AH Row: \(startingPointRow-(list.count/2))")
 print("AH Column: \(startingPointColumn-(list.count/2))")
 print("Steps: \(abs(startingPointRow-(list.count/2))+abs(startingPointColumn-(list.count/2)))")
 }
 }
 if power < 4 {
 //print("power: \(power)")
 //print("index: \(index)")
 //print("Counter: \(numCounter)")
 for x in list {
 //print("\(x)\t\t")
 }
 }
 }
 }
 }
 }
 
 for x in list {
 print("\(x) \t \t")
 }
*/
