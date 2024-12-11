# use writing and seeing before going to code ---> and iterate multiple steps to get hold of logic
# Thinking about logic + choosing Data Structure 
# variableToGetToAnswer and variable to store given values
# accumulator_variable
# logic + using Data Structure
# Loop termination in mind (loop termination logic)
# getting answer out through return
# thinking about edge cases


# 1
# 2 3
# 4 5 6
# 7 8 9 10


# for i in range(10): # starts from 0
#   print(i)

# wrong logic as i didn't try thinking
# for i in range(1,11):
#   for j in range(0,i):
#     print(i, end=" ")


# 1
# 2 3

# n= 1
# print(n)
# n+=1
# if n == target:
#   return
# if j==i-1:
#   print ('')


# n =1 # variable defined outside the functions are not accessible inside the function, to access it you need to make it global
# def print_pattern(target): # wrong pattern
#   n=1
#   for i in range(1,target+1):
#     for j in range(1, i+1):
#       print(n,end=" ")
#       n+=1
#       if n==target:
#         return
#       if j == i-1:
#         print("")
# 1 2 
# 3 4 5 
# 6 7 8 9
# print_pattern(10)




# def print_pattern(target):
#   n=1
#   for i in range(1,target+1):
#     for j in range(i):
#       print(n,end=" ")
#       n+=1
#       if n == target+1:
#         return
#     print("")
    

# print_pattern(10)
# # print_pattern(4)
  

# ----* - 1-1
# ---*** -2-3
# --***** 3-5
# -******* 4-7
# ********** 5-9

# n+=2

# def print_pattern(targetLevel): # completely wrong logic
#   n=1
#   for i in range(5,0,-1):
#     for j in range(0,i):
#       print(" ", end=" ")
#     for 
  
# def print_pattern(targetLevel): # incorrect pattens
#   n=1
#   for i in range(targetLevel):
#     print(' '*(targetLevel-i-1),end="")
#     print('*'*(i+2))

# print_pattern(5)

# def print_pattern(targetLevel): # incorrect pattens
#   n=1
#   for i in range(targetLevel):
#     print(' '*(targetLevel-i-1),end="")
#     if n==1:
#       print('*'*(n))
#       n+=2
#     else:
#       n+=2
#       print('*'*(n))

# print_pattern(5)


def print_pattern(n):
  for i in range(1,n+1):
    print(" "*(n-i)+"*"*(2*i-1))
print_pattern(5)