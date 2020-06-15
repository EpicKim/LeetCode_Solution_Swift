import UIKit

var str = "Hello, playground"

func twoSum(nums:[Int], target:Int) -> [Int] {
    for a in 0...(nums.count - 1) {
        for b in 1...(nums.count - 1) {
            if (nums[a] + nums[b] == target) {
                return [a,b]
            }
        }
    }
    return [0,0]
}

func 更好的方法(nums:[Int], target:Int) -> [Int] {
    var map = [Int: Int]()
    for a in 0...(nums.count - 1) {
        map[nums[a]] = a
    }
    for a in 0...(nums.count - 1) {
        var result = target - nums[a]
        var index = map[result]
        if (index != nil && a != index!) {
            return [a, index!]
        }
    }
    return [0,0]
}

var source = [3,2,4]
var target = 6
var result = 更好的方法(nums: source, target: target)
print(source[result.first!])
print(source[result.last!])
