nums = [2,20,4,10,3,4,5,1]
nums1 = [0,3,2,5,4,6,1,1]


# def bruteforce(nums):
#   res=0
#   store = set(nums)

#   for num in nums:
#     streak=0
#     curr=num
#     while curr in store:
#       streak+=1
#       curr+=1
#     res = max(res,streak)
#   return res


# print(bruteforce(nums))
# print(bruteforce(nums1))

#===========================================

# def sorting(nums):
#   if not nums:
#     return 0
#   res = 0
#   nums.sort()

#   curr=nums[0]
#   streak = 0
#   i=0
#   while i< len(nums):
#     if curr!=nums[i]:
#       curr=nums[i]
#       streak=0
#     while i<len(nums) and nums[i]==curr:
#       i+=1
#     streak+=1
#     curr+=1
#     res= max(res,streak)
#   return res

# print(sorting(nums))
# print(sorting(nums1))


#---------------------------------

def usingHashSet(nums):
  mySet = set(nums)
  longest =0
  for n in mySet:
    if (n-1) not in mySet:
      length=1
      while (n+length) in mySet:
        length+=1
      longest = max(length,longest)
  return longest

print(usingHashSet(nums))
print(usingHashSet(nums1))

#--------------------

# def usingHashMap(nums):