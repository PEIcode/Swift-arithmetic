import UIKit
let arr: NSArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

func binary(array: NSArray, data: Int) -> Int{
    var array = array as! [Int]
    var min = 0;
    var max = array.count - 1;
    var mid = 0;

    while (min <= max) {

        mid = (min + max) / 2

        if (array[mid] > data) {
            max = min - 1;
        } else if (array[mid] < data) {
            min = min + 1;
        } else {
            return mid;
        }
    }
    return -1
}

binary(array: arr, data: 18)
