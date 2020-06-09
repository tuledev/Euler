// https://projecteuler.net/problem=17
// If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
// If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
// NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

const DATA_DICT = {
  1: 'one',
  2: 'two',
  3: 'three',
  4: 'four',
  5: 'five',
  6: 'six',
  7: 'seven',
  8: 'eight',
  9: 'nine',
  10: 'ten',
  11: 'eleven',
  12: 'twelve',
  13: 'thirteen',
  15: 'fifteen',
  18: 'eighteen',
  20: 'twenty',
  30: 'thirty',
  30: 'forty',
  50: 'fifty',
  80: 'eighty',
};

// 1, 3, 4, 5, 6, 10, 20, 50, 100
const nameNumber = number => {
  if (number === 0) return '';
  if (DATA_DICT[number]) return DATA_DICT[number];
  if (number < 20) return DATA_DICT[number % 10] + 'teen';
  if (number < 100) {
    const name = DATA_DICT[Math.floor(number/10) * 10];
    return (name || (DATA_DICT[Math.floor(number/10)] + 'ty')) + (DATA_DICT[number % 10] || '');
  }
  if (number < 1000) {
    const name = DATA_DICT[Math.floor(number/100) * 100];
    const nameUnit = nameNumber(number % 100);
    return (name || (DATA_DICT[Math.floor(number/100)] + 'hundred')) + (nameUnit ? ('and' + nameUnit) : '');
  }
  if (number === 1000) return 'onethousand'
};

// console.log(nameNumber(2));
// console.log(nameNumber(3));
// console.log(nameNumber(4));
// console.log(nameNumber(7));
// console.log(nameNumber(12));
// console.log(nameNumber(10));
// console.log(nameNumber(11));
// console.log(nameNumber(12));
// console.log(nameNumber(13));
// console.log(nameNumber(17));
// console.log(nameNumber(15));
// console.log(nameNumber(20));
// console.log(nameNumber(21));
// console.log(nameNumber(22));
// console.log(nameNumber(32));
// console.log(nameNumber(34));
// console.log(nameNumber(54));
// console.log(nameNumber(67));
// console.log(nameNumber(60));
// console.log(nameNumber(50));
// console.log(nameNumber(100));
// console.log(nameNumber(101));
// console.log(nameNumber(111));
// console.log(nameNumber(211));
// console.log(nameNumber(313));
// console.log(nameNumber(333));
// console.log(nameNumber(555));

let length = 0;
for (let index = 1; index <= 1000; index++) {
  const name = nameNumber(index)  
  console.log(name, name.length);
  length += name.length;
}
console.log(length)
