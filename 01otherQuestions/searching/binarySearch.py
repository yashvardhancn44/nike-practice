arr=[42,5,2,4,22,34,9]
def bubbleSort(arr):
  for i in range(len(arr)):
    for j in range(0,len(arr)-i-1):
      if arr[j]>arr[j+1]:
        arr[j],arr[j+1]=arr[j+1],arr[j]
  return arr

def binarySearch(arr,target):
  sortedArr=bubbleSort(arr)
  left=0
  right=len(arr)-1

  while left < right:
    mid=(left+right)//2
    if target==arr[mid]:
      return True
    if target>arr[mid]:
      left=mid
    if target<arr[mid]:
      right=mid
  return False
print(binarySearch(arr,9))