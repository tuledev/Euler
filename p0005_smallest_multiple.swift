//
//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
//

func greatestCommonDivisor(_ num1: Int,_ num2: Int) -> Int {
  if num2 == 0 { return num1 }
  return greatestCommonDivisor(num2, num1 % num2)
}

func leastCommonMultiple(_ num1: Int, _ num2: Int) -> Int {
  return num1 * num2 / greatestCommonDivisor(num1, num2)
}

func smallestMultiple(_ number: Int) -> Int {
  return (2...number).reduce(1, { leastCommonMultiple($0, $1) })
}

print(smallestMultiple(10))
print(smallestMultiple(20))
