# 123
#---
0
# 123%10 = 3 + 0 (should need 30) --> so 3*10+ prevDig
# 30+2=32
# 320+1

## the above logic was wrong
"""
0
3*10+0 ->30
2*10+30 -> 50
hence logic was wrong.
"""

## correct logic
0
3+0
2+30
1+320


# variableToGetToAnswer
# accumulator_variable
# logic
# Loop termination in mind (loop termination logic)
# getting answer out


def is_palindrome(num):
  if num<0:
    return False
  origNum = num
  revNum = 0
  while num>0:  
    revNum = num%10 + revNum*10
    num=num//10
  return origNum == revNum

print(is_palindrome(121))   # Output: True
print(is_palindrome(-121))  # Output: False
print(is_palindrome(10))    # Output: False
