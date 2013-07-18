from nltk.corpus import wordnet
import fileinput

letter = "A"		# A-Z or [0-9] for numbers and [^A-Z0-9] for symbols
numWords = 0		# count # words as we go

for ext in fileinput.input("extensionLists/" + letter.upper() + ".csv"):
	ext.strip()
	ext = ext[0 : len(ext)-1]		# remove newline character :(
	ext = ext.lower()
	
	# via: http://stackoverflow.com/a/5351315/1167783
	if not wordnet.synsets(ext):
		pass
	else:
		numWords += 1
		with open("EnglishExtensions.csv", "a") as f:
			f.write(ext + "\n")

print("Found " + str(numWords) + " valid words!")