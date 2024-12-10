# Types are assigned in runtime - dynamically typed language

print("HI yash")
N=0

print(N)


n,h=0,"abc"


n= n+1
n+=1
# n++

# None

n=1
if n==0:
  n-=1
elif n==2:
  print("yash")
else:
  print("name")

a=5
if n==0 and a==5:
  print("n==0 and a==5")

b=10
if(n==0 and a==5
   and b==10):
  print("b==10")

n=0
while n<10:
  print(n)
  n+=1


for i in range(0,5,1):
  print(i)

for i in range(5,2,-1):
  print(i)

print(5/2)

print(5//2)
print(-3//2) # rouding down, not to zero

print(int(-3/2))

print(10%3)
print(-10%3) # -2

import math

print(math.fmod(-10,3))

print(math.floor(3/2))
print(math.ceil(3/2))
print(math.sqrt(25))
print(math.pow(2,2))


float("inf")
float("-inf")



arr = [1,2,3]
print(arr)
arr.append(4)
arr.pop()


arr.insert(1,7) # o(n)

arr[0] = 0
arr[3]=1

n = 5
arr = [1]*n
print(arr)
print(arr[1])
print(arr[-1])
print(arr[1:3]) # slicing

a,b,c=[1,2,3] #unpacking

nums = [1,2,3]

for i in range(len(nums)):
  print(nums[i])

for n in nums:
  print(n)

for i, n in enumerate(nums):
  print(i,n)


nums1 = [1,2,3]
nums2 = [4,5,6]

for n1,n2 in zip(nums1,nums2):
  print(n1,n2)

nums.reverse()
print(nums)

nums.sort()
print(nums)

nums.sort(reverse=True)
print(nums)

strarr = ['ant','yash','boy','c']
strarr.sort()
print(strarr)
strarr.sort(key=lambda x: len(x))
print(strarr)


# list comprehension

arr4 = [i for i in range(5)]
print(arr4)
arr5 = [i+1 for i in range(5)]

arr2d = [[0]*4 for i in range(4)] # this is the only way to get this particular result



# STRINGS
s ="abc"
print(s[1:2])

# s[0]=A # not possible (strings are immutable like in java)
s+="def" # new string again

print(int("1")+int("2"))
print(str(123)+str(123))

print(ord("a")) # Ascii value

strings = ['ab','bc','cd']

print("".join(strings))

from collections import deque
# queue in python are double ended queue.

myQueue = deque()

myQueue.append(1)
myQueue.append(2)
myQueue.pop()
myQueue.popleft() # constnat time operations
myQueue.appendleft(0)


#hashSet
# remove insert lookup in constant time

mySet = set()

mySet.add(1)
mySet.add(2)
mySet.add(3)

print(mySet)
print(len(mySet))

print(1 in mySet)
print(2 in mySet)
print(4 in mySet) # False

mySet.remove(3)

print(set([1,2,3]))
mySet = { i for i in range(5)}

# HASH MAPS
myMap = {}

myMap['alice']=88
myMap['bob'] = 77
print(myMap)
print(len(myMap))

myMap["alice"] = 90
print(myMap)
print("alice" in myMap)

myMap.pop("alice")

myMap = {"alice":90,"bob":70}

myMap = {i:2*i for i in range(5)}

for key in myMap:
  print(key,myMap[key])

for value in myMap.values():
  print(value)

for key, val in myMap.items():
  print(key,val)


# TOUPLES


tup = (1,2,3)
print(tup)
print(tup[0])
# cant modify the value

# used mostly as the key for hashmap and hashset, as list can't be keys

myNewMap = {(1,2):3}

myNewSet = {(1,2)}
myNewSet = set()
mySet.add((1,2))
print((1,2) in myNewSet)



# HEAPS

import heapq # minheap actually

minHeap = []

heapq.heappush(minHeap,3)
heapq.heappush(minHeap,2)
heapq.heappush(minHeap,4)

print(minHeap[0]) # gives min value

while len(minHeap):
  print(heapq.heappop(minHeap))




maxHeap = []

heapq.heappush(maxHeap,-3)
heapq.heappush(maxHeap,-2)
heapq.heappush(maxHeap,-4)
print(-1*maxHeap[0])

while len(maxHeap):
  print(-1*heapq.heappop(maxHeap))


arr10 = [2,1,8,4,5]

heapq.heapify(arr10)
while arr:
  print(heapq.heappop(arr))