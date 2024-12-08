arr=[42,5,2,4,22,34,9]

def bubbleSorting(arr):
  for i in range(len(arr)):
    for j in range(0,len(arr)-i-1):
      if arr[j]>arr[j+1]:
        arr[j],arr[j+1]=arr[j+1],arr[j]
  return arr

print(bubbleSorting(arr))
