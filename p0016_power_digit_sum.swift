//2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
//
//What is the sum of the digits of the number 2^1000?

class Node {
  var data: Int!
  var next: Node?
  
  init(data: Int) {
    self.data = data
  }
}

func multiList(head: Node, multi: Int) -> Node {
  var currentNode: Node? = head
  var endNode: Node?
  var remain = false
  while currentNode != nil {
    if let node = currentNode {
      node.data = node.data * multi + (remain ? 1 : 0)
      remain = false
      if node.data >= 10 {
        node.data = node.data % 10
        remain = true
      }
      currentNode = node.next
      if currentNode == nil {
        endNode = node
      }
    }
  }
  if remain {
    endNode?.next = Node(data: 1)
  }
  return head
}

func sumNode(head: Node) -> Int {
  var sum = 0
  var currentNode: Node? = head
  while currentNode != nil {
    sum = sum + currentNode!.data
    currentNode = currentNode?.next
  }
  return sum
}

func powerNumber(number: Int, power: Int) -> Node {
  if power == 0 {
    return Node(data: 1)
  }
  
  var node = Node(data: number)
  var currentPower = power - 1
  while currentPower > 0 {
    node = multiList(head: node, multi: number)
    currentPower -= 1
  }
  return node
}

func sumPowerDigit(digit: Int, power: Int) -> Int {
  let head = powerNumber(number: digit, power: power)
  let sum = sumNode(head: head)
  return sum
}

print(sumPowerDigit(digit: 2, power: 15))
print(sumPowerDigit(digit: 2, power: 1000))
