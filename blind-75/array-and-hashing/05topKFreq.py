nums = [1,2,2,3,3,3]
k=2

#----- if the frequency if of only one elem-----
# def sorting(nums,k):
#   count = { }
#   for num in nums:
#     count[num]= 1+count.get(num,0)
#   print(count)
#   for key,val in count.items():
#     if val== k:
#       return key

# print(sorting(nums,k))

#===================================

# def sorting(nums,k):
#   count = { }
#   for num in nums:
#     count[num]= 1+count.get(num,0)
#   print(count)
#   arr = []
#   for num,cnt in count.items():
#     arr.append([cnt,num])
#   arr.sort()

#   res=[]
#   while len(res)<k:
#     res.append(arr.pop()[1])
#   return res
# print(sorting(nums,k))


#=======================================

# import heapq

# def usingHeap(arr,k):
#   count = {}
#   for num in arr:
#     count[num] = 1+count.get(num,0)
#   heap = []
#   for num in count.keys():
#     heapq.heappush(heap,(count[num],num))
#     if len(heap)>k:
#       heapq.heappop(heap)
#   res = []
#   for i in range(k):
#     res.append(heapq.heappop(heap)[1])
#   return res


# print(usingHeap(nums,k))


#---------------------------------
freq = [[]for i in range(len(nums)+1)]
print(freq)

def usingBucketSort(nums,k):
  count={}
  freq = [[]for i in range(len(nums)+1)]
  print(freq)

  for num in nums:
    count[num] = 1+count.get(num,0)
  for num, cnt in count.items():
    freq[cnt].append(num)
    
  res=[]
  for i in range(len(freq)-1,0,-1):
    for num in freq[i]:
      res.append(num)
      if len(res)==k:
        return res

print(usingBucketSort(nums,k))