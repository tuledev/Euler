
func checkPalindrome(_ number: Int) -> Bool {
  return "\(number)" == String("\(number)".reversed())
}

func numWithDigit(_ num: Int) -> Int {
  if num == 1 { return 10 }
  return numWithDigit(num - 1) * 10
}

func largestPalindromeProduct(max: Int, step: Int, currentLargest: Int) -> Int {
  var maxNumber1 = max - step
  var maxNumber2 = max
  
  var largestPalindrome = 0
  while ( maxNumber1 * maxNumber2 > currentLargest && maxNumber1 > 0 && maxNumber2 > 0 && largestPalindrome == 0 )
  {
    let result = maxNumber1 * maxNumber2
    if checkPalindrome(result) {
      largestPalindrome = result
    }
    if maxNumber1 == maxNumber2 { maxNumber1 -= step }
    else { maxNumber2 -= 1 }
  }

  return largestPalindrome
}

func largestPalindromeProduct(numOfDigit: Int) -> Int {
  let max = numWithDigit(numOfDigit)
  var largestPalindrome = 0
  for step in 1..<max-1 {
    let palindrome = largestPalindromeProduct(max: max, step: step, currentLargest: largestPalindrome)
    if palindrome > largestPalindrome { largestPalindrome = palindrome }
  }
  return largestPalindrome
}

print(largestPalindromeProduct(numOfDigit: 3))
