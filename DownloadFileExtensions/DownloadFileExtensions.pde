
import java.util.Set;
import java.util.HashSet;

/*
DOWNLOAD ALL FILE EXTENSIONS
 Jeff Thompson | 2013 | www.jeffreythompson.org
 
 Little utility that scrapes filext.com for a list of all file
 extensions.
 
 */

String letter = "A";                             // A-Z or [0-9] for numbers and [^A-Z0-9] for symbols
Set<String> extensions = new HashSet<String>();  // removes duplicates automatically

println(letter.toUpperCase());
println("Getting source page (large download, may take a while)...");
String[] html = loadStrings("http://filext.com/alphalist.php?extstart=^" + letter.toUpperCase());

println("Extracting file extensions...");
for (int i=0; i<html.length; i++) {
  String[] ext = match(html[i], "td.*?target=\"_blank\">(.*?)</a>");
  if (ext != null) {
    extensions.add(ext[1]);
  }
}

println("\nFound " + extensions.size() + " unique file extensions!");

println("Saving the result...");
String[] extToSave = extensions.toArray(new String[0]);                     // get into array for saveStrings()
saveStrings("extensionLists/" + letter.toUpperCase() + ".csv", extToSave);  // save the result

println("All done!");
exit();

