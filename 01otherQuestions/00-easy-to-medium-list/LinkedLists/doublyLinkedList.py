class DNode:
  def __init__(self,data):
    self.data = data
    self.prev=None
    self.next = None

class DoublyLinkedList:
  def __init__(self):
    self.head = None
    self.tail=None

  def insert_at_beginning(self,data):
    if self.head is None:
      newNode = DNode(data)
      self.head = self.tail = newNode
      return
    newNode = DNode(data)
    newNode.prev = None
    currentHead = self.head
    currentHead.prev = newNode
    newNode.next = currentHead
    self.head=newNode

  def delete_from_beginning(self):
    if self.head is None:
      return
    self.head=self.head.next
    self.head.prev=None

  def insert_at_end(self,data):
    if self.tail is None:
      return
    newNode = DNode(data)
    currentTail = self.tail
    currentTail.next = newNode
    newNode.prev=currentTail
    newNode.next=None

myDLL = DoublyLinkedList()
myDLL.insert_at_beginning(5)
print(myDLL.)