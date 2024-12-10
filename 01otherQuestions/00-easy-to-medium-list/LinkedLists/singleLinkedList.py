class Node:
  def __init__(self,data):
    self.data = data
    self.next = None

class SingleLinkedList:
  def __init__(self):
    self.head=None

  def insertAtBeginning(self,data):
    newNode = Node(data)
    newNode.next = None
    self.head = newNode
  
  def insertAtEnd(self,data):
    newNode = Node(data)
    if self.head is None:
      self.head=newNode
      return;
    current = self.head
    while current.next!=None:
      current= current.next
    current.next=newNode

  def deleteNode(self,key):
    current = self.head
    if current is not None and current.data == key:
      self.head = current.next
      current = None
      return
    
    prev = None
    while current is not None and current.data !=key:
      prev = current
      current = current.next
    
    if current is None:
      print(f"key {key} not found in the List")

    prev.next = current.next
    current = None

  def traverse(self):
    if self.head is None:
      return []
    current = self.head
    elements = []
    while current.next!=None:
      elements.append(current.data)
      current=current.next
    elements.append(current.data)
    print(elements)

  def reverse(self):
    prev=None
    current=self.head

    while current:
      nextNode=current.next
      current.next=prev
      prev=current
      current=nextNode
    self.head = prev

  def search(self,key):
    if self.head is None:
      return -1
    current = self.head
    counter=0
    while current.data is not key:
      current = current.next
      counter+=1
    if current is None:
      return -1
    else:
      print(f"index is {counter}")
      return counter
    
  def length(self):
    counter = 0
    if self.head is None:
      print(0)
      return 0
    current = self.head
    while current:
      current=current.next
      counter+=1

    print(counter)
    return counter
  
mySLL = SingleLinkedList()
mySLL.insertAtBeginning(5)
mySLL.insertAtEnd(6)
mySLL.insertAtEnd(7)
mySLL.traverse()
mySLL.search(7)
mySLL.length()
# print(mySLL.head.data)
# print(mySLL.head.next.data)
# print(mySLL.head.next.next.data)