# n-1 present
# n actual len
# sum(n) - sum(n-1)


def find_missing_number(arr):
  actualListLen = len(arr)+1
  sum=0
  for num in range(1,actualListLen+1): # i had missed this range part logic
    sum+=num
  for i in arr:
    sum-=i
  return sum

print(find_missing_number([1, 2, 4, 5, 6]))  # Output: 3
print(find_missing_number([2, 3, 1, 5]))     # Output: 4
print(find_missing_number([1]))             # Output: 2