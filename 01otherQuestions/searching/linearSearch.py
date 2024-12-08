arr=[42,5,2,4,22,34,9]
searchNum = 22
def linearSearch(arr,searchNum):
  for val in arr:
    if val == searchNum:
      return True
  return False

print(linearSearch(arr,34))