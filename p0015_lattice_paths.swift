//
//Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
//
//
//How many such routes are there through a 20×20 grid?
//
// r r d d

func getPrimes(_ number: Int) -> [Int: Int] {
  var result = [Int:Int]()
  var currentPrime = 2
  var currentNumber = number
  while currentNumber > 1 {
    if currentNumber % currentPrime == 0 {
      currentNumber /= currentPrime
      result[currentPrime] = (result[currentPrime] ?? 0) + 1
    }
    else {
      currentPrime += 1
    }
  }
  return result
}

func *= (left: inout [Int:Int], right: [Int:Int]) {
  for (k, v) in right {
    left[k] = (left[k] ?? 0) + v
  }
}

func /= (left: inout [Int:Int], right: [Int:Int]) {
  for (k, v) in right {
    left[k] = (left[k] ?? 0) - v
  }
}

func factorialPrimes(from: Int, to: Int) -> [Int: Int] {
  var result = [Int:Int]()
  for number in (from...to) {
    result *= getPrimes(number)
  }
  return result
}

func factorial(from: Int, to: Int) -> Int {
  var result = 1
  for number in (from...to) {
    result = result * number
  }
  return result
}

func exponentiation(number: Int, expo: Int) -> Int {
  var result = 1
  for _ in (1...expo) {
    result = result * number
  }
  return result
}

func productPrimes(_ data:[Int: Int]) -> Int {
  var result = 1
  for (k, v) in data {
    if (v > 0) {
      result *= exponentiation(number: k, expo: v)
    }
  }
  return result
}

func latticePaths(row: Int, col: Int) -> Int {
  var numeratorPrimes = factorialPrimes(from: row + 1, to: row + col)
  let denominatorPrimes = factorialPrimes(from: 1, to: row)
  numeratorPrimes /= denominatorPrimes
  print(numeratorPrimes)
  return productPrimes(numeratorPrimes)
}

print(latticePaths(row: 2, col: 2))
print(latticePaths(row: 20, col: 20))
