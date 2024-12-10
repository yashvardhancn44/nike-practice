def myFun(n,m):
  return n*m


def outer(a,b):
  c='c'
  def inner():
    return a+b+c
  return inner()

print(outer('a','b'))

def double(arr, val):
  def helper():
    for i, n in enumerate(arr):
      arr[i]*2

    nonlocal val
    val*=2
  helper()
  print(arr,val)

nums = [1,2]
val =3
double(nums,val)


class MyClass:
  def __init__(self,nums):
    self.nums = nums
    self.size = len(nums)
  def getLength(self):
    return self.size
  def getDoubleLength(self):
    return 2*self.getLength()