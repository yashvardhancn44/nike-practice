str1 = 'yash'
str2 = 'ahsy'


# -----------USING SORTING -----------

# def usingSort(str1,str2):
#   if len(str1!=str2):
#     return False
#   # if(sorted(str1)==sorted(str2)):
#   #   return True
#   # else: 
#   #   return False
#   return sorted(str1)==sorted(str2)
# print(usingSort('yash','ahsy')) 

# --- HASH TABLE ---

# def usingHashTable(str1,str2):
#   if len(str2)!= len(str1):
#     return False
#   count1,count2={},{}
#   for i in range(len(str1)):
#     count1[str1[i]] = 1 + count1.get(str1[i],0)
#     count2[str2[i]] = 1 + count2.get(str2[i],0)
#   return count1==count2

# print(usingHashTable('yash','ahsy'))



# --- (MISTAKE) hash table optimal: using single dictionary---

# def optimalhash(str1,str2):
#   if len(str1)!=len(str2):
#     return False
#   count= {}
#   for i in range(len(str1)):
#     count[str1[i]]=count.get(str1[i],0)+1
#   print(count)
#   for i in range(len(str1)):
#     count[str2[i]]=count.get(str2[i])-1
#     if count[str2[i]]==0:
#       count.pop(str2[i])
#   if len(count)==0:
#     return True
#   return False

# print(optimalhash('yash','ahis'))


# ------------ hash table optimal: using single dictionary ------------

def optHashSingleDict(str1,str2):
  if len(str1)!=len(str2):
    return False
  count = [0]*26
  for i in range(len(str1)):
    count[ord(str1[i])-ord('a')]+=1
    count[ord(str2[i])-ord('a')]-=1

  for val in count:
    if val !=0:
      return False
    else:
      return True