// https://leetcode.com/problems/course-schedule/

// adjList[item[0]] ??= []; // works on Node v15.0.0
const canFinish = function (numCourses, prerequisites) {
  const adjList = {};
  prerequisites.forEach((item) => {
    adjList[item[0]] = adjList[item[0]] || [];
    adjList[item[0]].push(item[1]);
  });
  const taken = {};
  let possibleCourses = 0;
  for (var i = 0; i < numCourses; i++) {
    if (!taken[i] && (!adjList[i] || adjList[i].every((item) => taken[item]))) {
      taken[i] = true;
      possibleCourses++;
      i = -1;
    }
  }
  return possibleCourses === numCourses;
};

// using an adjacency Matrix — seems to works, but it's too inefficient to pass
const canFinish = function(numCourses, prerequisites) {
  let adjMatrix = Array.from(Array(numCourses), () => new Array(numCourses));
  prerequisites.forEach(item => {
    adjMatrix[item[1]][item[0]] = 1;
  })
  let taken = {};
  let possibleCourses = 0;
  do {
    var current = adjMatrix.findIndex((_row, i) => {
      if (taken[i]) return false;
      if (adjMatrix.every((row, j) => taken[j] || !row[i])) {
        taken[i] = true;
        possibleCourses++;
        return true;
      }
    })
  } while(current !== -1)
  return possibleCourses === numCourses;
}

// uses Object in adjList instead of array so that I can delete prereqs that have already been taken, but this is slower
const canFinish = function (numCourses, prerequisites) {
  const adjList = {};
  prerequisites.forEach((item) => {
    adjList[item[0]] = adjList[item[0]] || {};
    adjList[item[0]][item[1]] = true;
  });
  const taken = {};
  let possibleCourses = 0;
  for (var i = 0; i < numCourses; i++) {
    if (
      !taken[i] &&
      (!adjList[i] ||
        Object.keys(adjList[i]).every((item) => {
          if (taken[item]) return delete adjList[i][item];
        }))
    ) {
      taken[i] = true;
      possibleCourses++;
      delete adjList[i];
      i = -1;
    }
  }
  return possibleCourses === numCourses;
};
