arr = [1, 2, 3, 4, 2, 5, 6, 3, 7, 8]

def uSet(arr):
  seen = set()
  duplicates = set() # needs two sets remember
  for num in arr:
    if num in seen:
      duplicates.add(num)
    else:
      seen.add(num)
  uniqueElems = [ x for x in arr if x not in duplicates]
  return duplicates, uniqueElems
print(uSet(arr))


#===============

def UHashMap(arr):
  numberCount = {}
  duplicates = set()

  for num in arr:
    numberCount[num]= 1+numberCount.get(num,0)
    if numberCount[num]>1:
      duplicates.add(num)
  print(numberCount)
  uniqueElems = [ x for x in arr if x not in duplicates]
  return duplicates, uniqueElems
  
print(UHashMap(arr))

#===============

def uSorting(arr):
  arr.sort()
  duplicates = set()
  for i in range(len(arr)-1):
    if arr[i]==arr[i+1]:
      duplicates.add(arr[i])
  uniqueElems = [ x for x in arr if x not in duplicates]
  return duplicates, uniqueElems

print(uSorting(arr))


#===================================

def uBrute(arr):
  duplicates = set()
  for i in range(len(arr)):
    for j in range(i+1,len(arr)):
      if arr[i]==arr[j]:
        duplicates.add(arr[i])
        
  uniqueElems = [ x for x in arr if x not in duplicates]
  return duplicates, uniqueElems

print(uBrute(arr))

