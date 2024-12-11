# Thinking about logic + choosing Data Structure 
# variableToGetToAnswer and variable to store given values
# accumulator_variable
# logic + using Data Structure
# Loop termination in mind (loop termination logic)
# getting answer out through return
# thinking about edge cases


[1,3,44,9,10]


def binary_search(nums,target):
  if not nums:
    return -1
  if len(nums)==1:
    return nums[0]
  left=0
  right = len(nums)-1
  # nums= nums.sort()  # mistake here
  nums.sort()

  # while left<right: # missed writing =
  while left<=right:
    mid = (left+right)//2
    if nums[mid]==target:
      return mid
    elif nums[mid]<target:
      right = mid-1
    else:
      left = mid+1
  return -1
print(binary_search([1, 2, 3, 4, 5], 3))  # Output: 2
print(binary_search([1, 2, 3, 4, 5], 6))  # Output: -1
print(binary_search([], 1))               # Output: -1
