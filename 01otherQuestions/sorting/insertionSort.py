arr=[42,5,2,4,22,34,9]

# def insSort(arr):
#   for i in range(len(arr)):
#     for j in range(0,i):
#       if arr[i]<arr[j]:
#         arr[i],arr[j]=arr[j],arr[i]
#   return arr

def insSort(arr):
  for i in range(len(arr)):
    key = arr[i]
    j=i-1
    while j>=0 and key<arr[j]:
      arr[j+1]=arr[j] # as j+1 was earlier the key lement
      j-=1
    arr[j+1] = key # as arr[j] is already pushed earlier to arr[j+1]
  return arr
print(insSort(arr))