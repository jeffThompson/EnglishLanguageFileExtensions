/*
RANDOM FILE EXTENSION POETRY BUILDER
Jeff Thompson | 2013 | www.jeffreythompson.org

*/

int poemLength = 100;
boolean addTitle = true;
boolean randomBreaks = true;
float breakProb = 0.8;

String[] ext = loadStrings("../EnglishExtensions.csv");
String poem = "";

if (addTitle) {
  int titleLen = int(random(10));
  for (int i=0; i<titleLen; i++) {
    poem += ext[int(random(ext.length))].toUpperCase() + " ";
  }
  poem += "\n";
}

for (int i=0; i<poemLength; i++) {
  poem += ext[int(random(ext.length))] + " ";
  if (randomBreaks && random(1) > breakProb) poem += "\n";
}

println(poem);
exit();
