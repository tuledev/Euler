
func check(number: Int, multiples: [Int]) -> Bool {
  for multiple in multiples {
    if number % multiple == 0 {
      return true
    }
  }
  return false
}

func sumBelow(_ number: Int, multiples: [Int]) {
  var result = 0
  for index in 0..<number {
    if check(number: index, multiples: multiples) { result += index }
  }
  print("result", result)
}

sumBelow(1000, multiples: [3,5])
