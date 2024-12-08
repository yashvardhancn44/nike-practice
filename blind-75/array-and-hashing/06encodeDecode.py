strs = ["neet","code","love","you"]


# def encode(strs):
#   if not strs:
#     return ""
#   sizes =[]
#   for s in strs:
#     sizes.append(len(s))
#   coder=""
#   for sz in sizes:
#     coder+=str(sz)
#     coder+=","
#   coder+="#"
#   res=coder
#   for s in strs:
#     res=res+s
#   return res

# print(encode(strs))


# def decode(s):
#   if not s:
#     return []
#   sizes = []
#   res = []
#   #obsever the mulitiple i+1 in this nested while loops, they all are soo important
#   i=0
#   while s[i]!="#":
#     sz=""
#     while s[i]!=",":
#       sz+=s[i]
#       i+=1
#     sizes.append(int(sz))  
#     i+=1
#   i+=1
#   for sz in sizes:
#     res.append(s[i:i+sz])
#     i+=sz
#   return res

# print(decode("4,4,4,3,#neetcodeloveyou"))



#-----------------------------------------------

def encodeOpt(strs):
  res=""
  for s in strs:
    res+=str(len(s))+"#"+s
  return res

print(encodeOpt(strs))

def decodeOpt(s):
  res=[]

  i=0
  while i<len(s):
    j=i
    while s[j]!="#":
      j+=1
    length = int(s[i:j])
    i=j+1
    j=i+length
    res.append(s[i:j])
    i=j
  return res

print(decodeOpt("4#neet4#code4#love3#you"))