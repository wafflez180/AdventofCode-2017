import Cocoa

var banks = [0,5,10,0,11,14,13,4,11,8,8,7,1,4,12,11]//[0,2,7,0]//
var beforeState = -1
var finalState = 0

var counter = 0
var checkList:[[Int]] = []
var check = false
while check == false {
    //print(checkList)
    //print(banks)
    var largest = banks.max()!
    var largestIndex = banks.index(of: largest)!
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
    print(counter)
    if counter >= 10000 {
        for index in 0..<checkList.count {
            var list1:[Int] = checkList[index]
            var checkListCopy:[[Int]] = checkList
            let tindex = checkListCopy.index(where: { $0 == list1})
            checkListCopy[tindex!] = []
            if checkListCopy.contains(where: { $0 == list1 }) == true {
                print("WHAAAAT")
                print(index)
                print(checkListCopy.index(where: { $0 == list1 })!)
                check = true
            }
        }
    }
}
print(counter)
