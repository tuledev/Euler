//
//The following iterative sequence is defined for the set of positive integers:
//
//n → n/2 (n is even)
//n → 3n + 1 (n is odd)
//
//Using the rule above and starting with 13, we generate the following sequence:
//
//13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
//It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
//
//Which starting number, under one million, produces the longest chain?
//
//NOTE: Once the chain starts the terms are allowed to go above one million.


func nextChain(_ number: Int) -> Int {
  return (number % 2 == 0) ? (number/2) : ((3*number) + 1)
}

var chainData = [Int: Int]()
chainData[1] = 1
func collatzChainFrom(_ number: Int) -> Int {
  var currentNumber = number
  var countCollatz = 0
  var currentChain = [Int: Int]()
  while chainData[currentNumber] == nil {
    countCollatz += 1
    currentChain[currentNumber] = countCollatz
    currentNumber = nextChain(currentNumber)
  }
  
  let lengthCurrentCollatz = currentChain.count
  for (key, value) in currentChain {
    chainData[key] = lengthCurrentCollatz - value + 1 + chainData[currentNumber]!
  }
  
  return chainData[number]!
}

func longestCollatzSequenceUnder(_ number: Int) -> Int {
  var countChain = 0
  var longestCollatzNumber = 1
  for i in (1..<number).reversed() {
    let count = collatzChainFrom(i)
    if (count > countChain) {
      countChain = count
      longestCollatzNumber = i
    }
  }
  return longestCollatzNumber
}

print(longestCollatzSequenceUnder(5))
print(longestCollatzSequenceUnder(15))
print(longestCollatzSequenceUnder(1000000))
