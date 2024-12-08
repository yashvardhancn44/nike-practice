arr = [1,2,3,4,6,-1,10,-11]
target = 11

def bruteForce(arr,target):
  for i in range(len(arr)):
    for j in range(i+1,len(arr)):
      if arr[i]+arr[j]==target:
        return [i,j]
  return None

print(bruteForce(arr,target))

def sorting(arr,target):
  A =[]
  for i,val in enumerate(arr):
    A.append([val,i])
  print(A)
  A.sort()
  print(A)

  i,j=0,len(arr)-1
  while i<j:
    curr = A[i][0]+A[j][0]
    if curr == target:
      return [min(A[i][1],A[j][1]),max(A[i][1],A[j][1])]
    elif curr<target:
      i+=1
    else:
      j-=1
print(sorting(arr,target))

def hashMapDoublePass(arr,target):
  indices = {}
  for i, val in enumerate(arr):
    indices[val]=i
  for i,val in enumerate(arr):
    diff = target-val
    if diff in indices and indices[diff]!=i:
      return[i,indices[diff]]

print(hashMapDoublePass(arr,target))


def hashMapSinglePass(arr,target):
  prevMap={}
  for i,val in enumerate(arr):
    diff = target-val
    if diff in prevMap:
      return [prevMap[diff],i]
    else:
      prevMap[val]=i

print(hashMapSinglePass(arr,target))