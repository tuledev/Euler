
func nextFibo(current: Int, previous: Int) -> Int {
  return current + previous
}

func updateSum(currentSum: Int, value: Int) -> Int {
  return (value % 2 == 0) ? currentSum + value : currentSum
}

func sumEvenFibo(upto: Int) -> Int {
  var previousValue = 1
  var currentValue = 2
  var sum = 0
  repeat {
    sum = updateSum(currentSum: sum, value: currentValue)

    let nextValue = nextFibo(current: currentValue, previous: previousValue)

    previousValue = currentValue
    currentValue = nextValue
  }
  while currentValue <= upto
  
  return sum
}

print(sumEvenFibo(upto: 4000000))
