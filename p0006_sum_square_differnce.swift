//
//The sum of the squares of the first ten natural numbers is,
//
//1^2 + 2^2 + ... + 10^2 = 385
//The square of the sum of the first ten natural numbers is,
//
//(1 + 2 + ... + 10)^2 = 552 = 3025
//Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
//
//Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
//

// (1+2+3+4)^2 = 1^2 + 2*1*(2+3+4) + (2+3+4)^2 = 1^2 + 2*1*(2+3+4) + 2^2 + 2*2*(3+4) + 3^2 + 2*3*4 + 4^2
// (1+2+3+4)^2 - 1^2 - 2^2 - 3^2 - 4^2 = 2(1*2 + 1*3 + 1*4 + 2*3 + 2*4 + 3*4)
// = 2(1(2+3+4) + 2(3+4) + 3*4)
//
// 1+2+3+4+5+6+7+8+9+10 = (1+10)*(10)/2
// 5+6+7+8+9+10 = (1+10)*10/2 - (1+4)*4/2

func sumx2(from head: Int, to tail: Int) -> Int {
  return (1 + tail ) * tail - (1 + head) * head
}

func sumSquareDifference(_ number: Int) -> Int {
  var result = 0
  for index in (1...(number)) {
    result += index*sumx2(from: index, to: number)
  }
  return result
}

print(sumSquareDifference(10)) // 2640
print(sumSquareDifference(100)) // 25164150
