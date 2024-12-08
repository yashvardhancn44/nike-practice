arr=[42,5,2,4,22,34,9]

def merge(leftArr,rightArr):
  result = []
  i=j=0
  while i<len(leftArr) and j<len(rightArr):
    if leftArr[i] < rightArr[j]:
      result.append(leftArr[i])
      i+=1
    elif rightArr[j]<leftArr[i]: # had missed el here
      result.append(rightArr[j])
      j+=1
  while i<len(leftArr):
    result.append(leftArr[i])
    i+=1
  # result.extend(arr[i:])
  while j<len(rightArr):
    result.append(rightArr[j])
    j+=1
  # result.extend(arr[j:])  
  return result

    

def mergSort(arr):
  if len(arr)<=1:
    return arr
  
  mid=len(arr)//2
  leftArr= mergSort(arr[:mid])
  rightArr=mergSort(arr[mid:])
  return merge(leftArr,rightArr)

print(mergSort(arr))