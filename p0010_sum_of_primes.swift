//The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
//Find the sum of all the primes below two million.

func checkPrime(_ number: Int) -> Bool {
  var isPrime = true
  let upper = Int((Double(number)).squareRoot())
  for index in stride(from: 3, through: upper, by: 2) {
    if number % index == 0 {
      isPrime = false
      break
    }
  }
  return isPrime
}

func sumPrimes(_ below: Int) -> Int {
  var sum = 2
  for index in stride(from: 3, to: below, by: 2) {
    if checkPrime(index) {
      sum += index
    }
  }
  return sum
}

print(sumPrimes(10))
print(sumPrimes(2000000))
