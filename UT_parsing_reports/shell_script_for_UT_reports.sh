a=($(grep -Pom9 '(?<=hostnamename=")[^"]+' test-output.xml))
echo $a
b=($(grep -Pom9 '(?<=errors=")[^"]+' test-output.xml))
echo $b
c=($(grep -Pom9 '(?<=failures=")[^"]+' test-output.xml))
echo $c
d=($(grep -Pom9 '(?<=skipped=")[^"]+' test-output.xml))
echo $d
e=($(grep -Pom9 '(?<=tests=")[^"]+' test-output.xml))
echo $e
f=($(grep -Pom9 '(?<=time=")[^"]+' test-output.xml))
echo $f

sed -Ei "s/(errors)>1</\1>$b</" sample.xml
sed -Ei "s/(failures)>1</\1>$c</" sample.xml
sed -Ei "s/(skipped)>1</\1>$d</" sample.xml
sed -Ei "s/(tests)>1</\1>$e</" sample.xml
sed -Ei "s/(time)>1</\1>$f</" sample.xml
