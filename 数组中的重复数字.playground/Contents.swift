class Solution {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        let sortNums = nums.sorted { return $0 >= $1 }
        var _repeat = sortNums[0]
        
        for i in 0...(sortNums.count - 2) {
            _repeat = sortNums[i]
            let num = sortNums[i + 1]
            if _repeat == num {
                return _repeat
            }
        }
        return nums[0];
    }
}



assert(Solution().findRepeatNumber([2, 3, 1, 0, 2, 5, 3]) == 2)
