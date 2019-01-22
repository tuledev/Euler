
func largestPrimeNumberOf(number: Int) -> Int {
  var currentNumber = number
  var lastestPrime = 1
  
  for index in stride(from: 3, to: number/2, by: 2) {
    if (currentNumber % index == 0) {
      currentNumber = currentNumber / index
      lastestPrime = index
      if (index > currentNumber/2) {
        return lastestPrime
      }
    }
  }
  return lastestPrime
}


print(largestPrimeNumberOf(number: 600851475143))
