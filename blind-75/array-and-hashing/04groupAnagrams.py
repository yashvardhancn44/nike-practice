strs = ["act","pots","tops","cat","stop","hat"]

print((sorted(strs[0])))
print("".join(sorted(strs[0])))

from collections import defaultdict

def sorting(strs):
  res = defaultdict(list)
  for s in strs:
    sortedS = "".join(sorted(s))
    res[sortedS].append(s)
  print(res)
  return list(res.values())
print(sorting(strs))


def hashtable(strs):
  res = defaultdict(list)
  for s in strs:
    count = [0]*26
    for c in s:
      count[ord(c)-ord('a')]+=1
    res[tuple(count)].append(s)
  return list(res.values())

print(hashtable(strs))
  