function flattenStack(obj) {
  let stack = [obj];
  let result = {};
  while (stack.length !== 0) {
    let currentObj = stack.pop();
    let arr = Object.keys(currentObj);
    for (let i = 0; i < arr.length; i++) {
      let key = arr[i];
      let value = currentObj[arr[i]];
      if (typeof value === 'string' || typeof value === 'number') {
        result[key] = value;
      } else {
        stack.push(value);
      }
    }
  }
  return result;
}

let obj = {1: 'a', 2: 'b', 3: { 4: 'd', 5: 'e'}}

flattenStack(obj);

console.log(typeof(obj))

const input = {
  1: 1,
  2: '2',
  3: {
    4: 'hello',
    5: {
      6: 18,
    },
  },
};

Output = { '1': 1, '2': '2', '4': 'hello', '6': 18 }


// function flatten(obj) {
//   for(x in obj) {
//     if(typeof(obj[x]) === 'object') {
//       obj = Object.assign(obj, obj[x])
//       delete obj[x]
//       flatten(obj)
//     }
//   }
//   return obj;
// }

function flatten(obj) {
  for(x in obj) {
    if(typeof(obj[x]) === 'object') {
      const inner = obj[x];
      delete obj[x];
      obj = Object.assign(obj, flatten(inner));
    }
  }
  return obj;
}


console.log(flatten(obj));
flatten(input);