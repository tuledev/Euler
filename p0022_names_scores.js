let fs = require('fs');

let filename = 'p0022_names.txt';

let content = fs.readFileSync(process.cwd() + '/' + filename).toString();

let names = content.replace(/"/g, '').split(',');

names.sort((a, b) => a.localeCompare(b));

console.log(names[0].charCodeAt(0));

const alphabet = 'abcdefghijklmnopqrstuvwxyz'.toUpperCase().split('');
const alphaValue = {};
for (let index = 0; index < alphabet.length; index++) {
  const element = alphabet[index];
  alphaValue[element] = element.charCodeAt(0) - 64;
}

const sumWord = word => {
  return word.split('').reduce((a, b) => a + alphaValue[b], 0);
};

let sum = 0;
for (let index = 0; index < names.length; index++) {
  const element = names[index];
  const score = sumWord(element) * (index + 1);
  if (element === 'COLIN') {
  }
  sum += score;
}

console.log("TCL: sum", sum);