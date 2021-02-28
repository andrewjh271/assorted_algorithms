### Balanced Substring Problem

A string is called balanced when every letter occurring in the string appears both in upper- and lowercase. 
For example, the string 'CATattac' is balanced (a, c, and t occur in both cases), but 'Madam' is not 
(d and a appear only in lower case). Note that the number of occurrences does not matter.
Write a function that, given a string S of length N, returns the length of the shortest 
balanced fragment of S. If S does not contain any balanced fragments, the function should return -1.

```
Examples:
balancedFragmentLength('azABaabza') // shortest balanced fragment is 'ABaab', returns 5
balancedFragmentLength('TacoCat') // there is no balanced fragment, returns -1
balancedFragmentLength('AcZCbaBz') // shortest balanced fragment is whole string, returns 8
balancedFragmentLength('abcdefghijklmnopqrstuvwxyz') // no balanced fragment, returns -1
```

Note: I prefer to return the minimum substring rather than its length

###### Benchmarks

```ruby
STRINGS = %w[
	azABaabza
	TacoCat
	AcZCbaBz
	abcdefghijklmnopqrstuvwxyz
	abcdefgHIJABCDEFGahij
	catAttaCaTtaca
	catAttaCattacTa
  jsflsdifsjdflisjfsldkfjsldfkjdlsfiajfljlkclakdsjfasldkfjasifjsLFJSLFSKFJDKFJjkjsfladfjJKD
 ]
# n = 50000
```
```pseudocode
       													user     system      total        real
My original algorithm: 			166.911842   0.368075 167.279917 (167.773202)
       													user     system      total        real
My algorithm w/ hashes: 		163.088131   0.945866 164.033997 (165.704941)
       													user     system      total        real
Merging interval algorithm: 111.103705   0.701669 111.805374 (112.713613)
```



```ruby
STRINGS = %w[
	azABaabza
	TacoCat
	AcZCbaBz
	abcdefghijklmnopqrstuvwxyz
	abcdefgHIJABCDEFGahij
	catAttaCaTtaca
	catAttaCattacTa
 ]
# n = 50000
```
```pseudocode
       													user     system      total        real
My original algorithm:  		34.858485   0.207900  35.066385 ( 35.321543)
       													user     system      total        real
My algorithm w/ hashes: 		33.806029   0.172142  33.978171 ( 34.177259)
       													user     system      total        real
Merging interval algorithm: 52.727676   0.360804  53.088480 ( 53.535495)
```
