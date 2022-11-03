#!/bin/bash
a=($(grep -Pom9 '(?<=pass=")[^"]+' Robot-Results/output.xml))

b=($(grep -Pom9 '(?<=fail=")[^"]+' polarisoutput.xml))

c=($(grep -Pom9 '(?<=skip=")[^"]+' polarisoutput.xml))
cp sample.xml robot_result.xml
sed -Ei "s/(pass)>1</\1>${a[0]}</" robot_result.xml
sed -Ei "s/(pass)>2</\1>${a[1]}</" p2.xml
sed -Ei "s/(pass)>3</\1>${a[2]}</" p2.xml
sed -Ei "s/(pass)>4</\1>${a[3]}</" p2.xml
sed -Ei "s/(pass)>5</\1>${a[4]}</" p2.xml
sed -Ei "s/(pass)>6</\1>${a[5]}</" p2.xml
sed -Ei "s/(pass)>7</\1>${a[6]}</" p2.xml
sed -Ei "s/(pass)>8</\1>${a[7]}</" p2.xml
sed -Ei "s/(pass)>9</\1>${a[8]}</" p2.xml
sed -Ei "s/(fail)>1</\1>${b[0]}</" p2.xml
sed -Ei "s/(fail)>2</\1>${b[1]}</" p2.xml
sed -Ei "s/(fail)>3</\1>${b[2]}</" p2.xml
sed -Ei "s/(fail)>4</\1>${b[3]}</" p2.xml
sed -Ei "s/(fail)>5</\1>${b[4]}</" p2.xml
sed -Ei "s/(fail)>6</\1>${b[5]}</" p2.xml
sed -Ei "s/(fail)>7</\1>${b[6]}</" p2.xml
sed -Ei "s/(fail)>8</\1>${b[7]}</" p2.xml
sed -Ei "s/(fail)>9</\1>${b[8]}</" p2.xml
sed -Ei "s/(skip)>1</\1>${c[0]}</" p2.xml
sed -Ei "s/(skip)>2</\1>${c[1]}</" p2.xml
sed -Ei "s/(skip)>3</\1>${c[2]}</" p2.xml
sed -Ei "s/(skip)>4</\1>${c[3]}</" p2.xml
sed -Ei "s/(skip)>5</\1>${c[4]}</" p2.xml
sed -Ei "s/(skip)>6</\1>${c[5]}</" p2.xml
sed -Ei "s/(skip)>7</\1>${c[6]}</" p2.xml
sed -Ei "s/(skip)>8</\1>${c[7]}</" p2.xml
sed -Ei "s/(skip)>9</\1>${c[8]}</" p2.xml
cat p2.xml
