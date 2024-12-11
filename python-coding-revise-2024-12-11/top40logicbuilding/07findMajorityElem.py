# Thinking about logic + choosing Data Structure 
# variableToGetToAnswer
# accumulator_variable
# logic + using Data Structure
# Loop termination in mind (loop termination logic)
# getting answer out through return
# thinking about edge cases

# i could add all elem in a dic counting for numFreq and then iterate throgh it again and see which solves the solution. 


# Boyer-Moore Majority Vote algorithm

def find_majority_element(nums):
  if len(nums)==1:
    return nums[0]
  if len(nums)<1:
    return None
  count =0
  candidate= None
  for i in nums:
    if count ==0:
      candidate = i
    count+=(1 if i==candidate else -1)
  return candidate

print(find_majority_element([3, 3, 4, 2, 3, 3, 3]))  # Output: 3
print(find_majority_element([1, 1, 1, 2, 3, 1, 1]))  # Output: 1
print(find_majority_element([2, 2, 2, 2, 1, 2]))     # Output: 2