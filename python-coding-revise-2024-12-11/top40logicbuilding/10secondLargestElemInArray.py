# use writing and seeing before going to code ---> and iterate multiple steps to get hold of logic
# Thinking about logic + choosing Data Structure 
# variableToGetToAnswer and variable to store given values
# accumulator_variable
# logic + using Data Structure
# Loop termination in mind (loop termination logic)
# getting answer out through return
# thinking about edge cases

# sort and find the second largest 
# make it a set and convert it into array and find second largest

# using two storing variables

[1,6,29,8,7,9]

# fl = minmax
# sl = minmax

# i>fl
# sl = fl
# fl = ii0

# <fl >sl 
# sl = i





def second_largest(nums):
  if len(nums) == 0:
    return None
  if len(nums)==1:
    return None
  # second_largest, first_largest = float('-inf') # wrong way of doingg it
  second_largest = first_largest = float('-inf')
  for i in nums:
    if i>first_largest:
      second_largest = first_largest
      first_largest = i
    elif first_largest>i>second_largest:
      second_largest = i
  return second_largest if second_largest!= float("-inf") else None
  
print(second_largest([3, 2, 1, 5, 4]))  # Output: 4
print(second_largest([10, 10, 9]))      # Output: 9
print(second_largest([1]))             # Output: None