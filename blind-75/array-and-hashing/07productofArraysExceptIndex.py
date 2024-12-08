nums = [1,2,4,6]
nums1 = [-1,0,1,2,3]

def bruteForce(nums):
  res = [0]*len(nums)
  for i in range(len(nums)):
    prod=1
    for j in range(len(nums)):
      if i==j:
        continue
      prod*=nums[j]
    res[i]=prod
  return res      

print(bruteForce(nums))
print(bruteForce(nums1))


def divtechnique(nums):
  prod,zero_cnt = 1,0
  for num in nums:
    if num:
      prod*=num
    else:
      zero_cnt+=1
  if zero_cnt>1: return [0]*len(nums)
  
  res = [0]*len(nums)
  for i,val in enumerate(nums):
    if zero_cnt: 
      res[i] =0 if val else prod
    else: res[i]=prod//val
  return res

print(divtechnique(nums))
print(divtechnique(nums1))


#======================================


def prefSuf(nums):
  n = len(nums)
  pref=[0]*n
  suff = [0]*n
  res = [0]*n

  pref[0]=1
  suff[n-1]=1

  for i in range(1,n):
    pref[i]=nums[i-1]*pref[i-1]
  for i in range(n-2,-1,-1): # look at this range, its tricky
    suff[i]=nums[i+1]*suff[i+1]
  for i in range(n):
    res[i]=pref[i]*suff[i]
  return res


print(prefSuf(nums))
print(prefSuf(nums1))

def prefSuffOpt(nums):
  n= (len(nums))
  res =[1]*n

  prefix =1
  for i in range(n):
    res[i]=prefix
    prefix*=nums[i]
  postfix = 1

  for i in range(n-1,-1,-1):
    res[i]*=postfix
    postfix*=nums[i]
  return res
print(prefSuffOpt(nums))
print(prefSuffOpt(nums1))
