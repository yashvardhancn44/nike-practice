# Thinking about logic + choosing Data Structure 
# variableToGetToAnswer
# accumulator_variable
# logic + using Data Structure
# Loop termination in mind (loop termination logic)
# getting answer out


# 10
# [1,2,7,3,5,9]
# can do it in brute force and the tuple into a list

# using set




def find_pairs(nums,target):
  accumulatorList = set()
  myLookUpSet = set(nums)
  for i in nums:
    pairDig = target - i
    if pairDig in myLookUpSet:
      # accumulatorList.add((i,pairDig))
      accumulatorList.add((min(i,pairDig),max(i,pairDig)))
  return accumulatorList

print(find_pairs([2, 4, 3, 5, 7, 8, -1], 7))  # Output: [(2, 5), (3, 4), (-1, 8)]
print(find_pairs([1, 1, 2, 3, 4], 5))         # Output: [(1, 4), (2, 3)]
print(find_pairs([1, 2, 3, 4, 5], 10))        # Output: []

# got wrong output earlier because i missed - pairs.add((min(num, diff), max(num, diff)))
# {(8, -1), (-1, 8), (3, 4), (4, 3), (2, 5), (5, 2)}
# {(2, 3), (3, 2), (4, 1), (1, 4)}
# {(5, 5)}