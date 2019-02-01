//A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
//
//  a2 + b2 = c2
//  For example, 32 + 42 = 9 + 16 = 25 = 52.
//
//  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
//Find the product abc.

func pythagoreamTriplet(_ sum: Int) -> Int {
  for a in (1...sum) {
    let a2 = a * a
    for b in (1...sum) {
      let b2 = b * b
      for c in (1...sum) {
        let c2 = c * c
        if a + b + c == sum && a2 + b2 == c2 {
          return a*b*c
        }
      }
    }
  }
  return 0
}

func pythagoreamTriplet2(_ sum: Int) -> Int {
  for a in (1...sum-1) {
    let a2 = a * a
    for b in (a...sum) {
      let b2 = b * b
      let c = sum - a - b
      let c2 = c * c
      if a + b + c == sum && a2 + b2 == c2 {
        return a*b*c
      }
    }
  }
  return 0
}

func pythagoreamTriplet3(_ sum: Int) -> Int {
  for a in (1...sum-1) {
    let b = (sum*a - sum*sum/2)/(a - sum)
    let c = sum - a - b
    if a + b + c == sum && a*a + b*b == c*c {
      return a*b*c
    }
  }
  return 0
}

//print(pythagoreamTriplet(1000))
//print(pythagoreamTriplet2(1000))
print(pythagoreamTriplet3(1000))
