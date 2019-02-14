//The prime factors of 13195 are 5, 7, 13 and 29.
//
//What is the largest prime factor of the number 600851475143 ?
//
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
