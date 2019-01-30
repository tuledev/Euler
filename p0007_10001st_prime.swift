//By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//
//What is the 10 001st prime number?

func isPrime(_ number: Int) -> Bool {
  var isPrime = true
  let last = number/3
  let sequence = stride(from: 3, through: last, by: 2)
  
  for iNumber in sequence {
    if number % iNumber == 0 {
      isPrime = false
      break
    }
  }
  return isPrime
}

func nstPrime(_ number: Int) -> Int {
  var nst = 1
  var currentNumber = 3
  var currentPrime = 2
  while (nst < number) {
    if isPrime(currentNumber) {
      nst += 1
      currentPrime = currentNumber
      print(currentNumber)
    }
    currentNumber += 2
  }
  return currentPrime
}

print("nstPrime(6)")
print(nstPrime(6))
print("nstPrime(13)")
print(nstPrime(13))
print("nstPrime(10001)")
print(nstPrime(10001))
