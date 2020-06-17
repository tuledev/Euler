// https://projecteuler.net/problem=20
// n! means n × (n − 1) × ... × 3 × 2 × 1
// For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
// and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
// Find the sum of the digits in the number 100!

let resVector = [1];
let carry = 0;
const multi = mulNumber => {
  for (let index = 0; index < resVector.length; index++) {
    const number = resVector[index];
    const res = number * mulNumber + carry;
    resVector[index] = res % 10;
    carry = Math.floor(res / 10);
  }
  let i = resVector.length;
  while (carry >= 10) {
    resVector[i++] = carry % 10;
    carry = Math.floor(carry / 10);
  }
  resVector[i] = carry;
  carry = 0;
};

const factorial = (number) => {
  for (let index = 1; index <= number; index++) {
    multi(index);
  }
}

const sum = () => {
  let res = 0;
  for (let index = 0; index < resVector.length; index++) {
    res += resVector[index];
  }
  return res;
}

factorial(10);
console.log(sum());

