# arr = [12,4,5,2,12]
arr = [12,4,5,2]

#-----------BRUTE FORCE----------------

# def containsDuplicateBruteForce(arr):
#     for i in range(len(arr)):
#       for j in range(i+1,len(arr)):
#         if(arr[i]==arr[j]):
#           return True
#     return False

# print(containsDuplicateBruteForce(arr))

#------------------SORTING-------------

# def containsDuplicateSorting(arr):
#   arr.sort()
#   for i in range(len(arr)-1):
#     if arr[i]==arr[i+1]:
#       return True
#   return False

# print(containsDuplicateSorting(arr))


#--------HASH SET-----------

# def containsDuplicateHashSet(arr):
#   mySet = set()
#   for n in arr:
#     if n in mySet:
#       return True
#     else:
#       mySet.add(n)
#   return False

# print(containsDuplicateHashSet(arr))

#----------------HASH SET LENGTH---

# def contDupHashSetLength(arr):
#   if(len(set(arr))==len(arr)):
#     return False
#   else:
#     return True
  
# print(contDupHashSetLength(arr))
