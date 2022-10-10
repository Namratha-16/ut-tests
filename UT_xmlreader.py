# Importing the required libraries
import xml.etree.ElementTree as Xet
#giving input of xml file 
xmlparse = Xet.parse('coverage-output.xml')
#fetching root tag below
root = xmlparse.getroot()
#printing root tag
print(root.tag)

print(root.attrib)
output=root.attrib
errors=output.get('errors')
failures=output.get('failures')
total_testcases=output.get('tests')
output.get('skipped')
print(errors)
print(failures)
print(total_testcases)
