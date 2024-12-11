# use writing and seeing before going to code ---> and iterate multiple steps to get hold of logic
# Thinking about logic + choosing Data Structure 
# variableToGetToAnswer and variable to store given values
# accumulator_variable
# logic + using Data Structure
# Loop termination in mind (loop termination logic)
# getting answer out through return
# thinking about edge cases


[1,6,29,8,7,9]

# fl 
# sl 
# tl 

# i>fl 
# tl = sl 
# sl = fl 
# fl = i 

# i < fl and i > sl
# tl = sl 
# sl = i 

# i <sl and i > tl 
# tl = i 



def third_largest(nums):
  if not nums:
    return None
  if len(nums)<=2:
    return None
  
  f_l = float("-inf")
  s_l = float("-inf")
  t_l = float("-inf")


  for num in nums:
    if num>f_l:
      t_l = s_l
      s_l = f_l
      f_l = num
    elif num<f_l and num >s_l:
      t_l = s_l
      s_l = num
    elif num<s_l and num >t_l:
      t_l= num
  return t_l if t_l!=float('-inf') else None

print(third_largest([3, 2, 1, 5, 4]))  # Output: 4
print(third_largest([10, 10, 9]))      # Output: 9
print(third_largest([1]))             # Output: None
