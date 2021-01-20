#locate file path
from tkinter.filedialog import askopenfilename
filename = askopenfilename()

# import packages
import PyPDF2
import re

# open the pdf file
object = PyPDF2.PdfFileReader(filename)

# get number of pages
NumPages = object.getNumPages()

# define keyterms
String = "example_1, example_2, example_3".replace(", ", "|")
# extract text and do the search
for i in range(0, NumPages):
    PageObj = object.getPage(i)
    print("this is page " + str(i)) 
    Text = PageObj.extractText() 
    # print(Text)
    ResSearch = re.search(String, Text)
    print(ResSearch)