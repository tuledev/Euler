// https://projecteuler.net/problem=19
// You are given the following information, but you may prefer to do some research for yourself.
// 1 Jan 1900 was a Monday.
// Thirty days has September,
// April, June and November.
// All the rest have thirty-one,
// Saving February alone,
// Which has twenty-eight, rain or shine.
// And on leap years, twenty-nine.
// A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
// How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

const dayOfMonth = (month, year) => {
  if ([4, 6, 9, 11].includes(month)) return 30;
  if (month === 2) return dayOfFebruary(year);
  return 31;
}

const dayOfFebruary = (year) => {
  const isLeapYear = (year) => {
    if (year % 400 === 0) return true;
    if (year % 100 === 0) return false;
    return year % 4 === 0;
  }
  return isLeapYear(year) ? 29 : 28;
}

let dayCount = 0;
let sundayCount = 0;

for (let year = 1900; year < 2000; year++) {
  for (let month = 1; month <= 12; month ++) {
    dayCount += dayOfMonth(month, year);
    if (dayCount % 7 === 0 && year >= 1901) {
      sundayCount += 1;
			console.log("TCL: sundayCount", sundayCount, month, year);
    }
  } 
}

console.log(sundayCount);