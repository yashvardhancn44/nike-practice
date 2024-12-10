arr=[42,5,2,4,22,34,9]

def quickSorting(arr):
  if len(arr)<=1:
    return arr
  pivot = arr[0]
  less=[x for x in arr[1:] if x<=pivot]
  more = [x for x in arr[1:] if x>pivot]
  return quickSorting(less)+[pivot]+quickSorting(more)

print(quickSorting(arr))