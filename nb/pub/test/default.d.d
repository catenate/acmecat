#!/dis/sh
filext = $1
noext = `{echo $filext | sed 's,\.[^.]+$,,'}

echo '#!/dis/sh
flag x +
echo '^$noext^' > '$noext 
exit $noext' > $noext^.do
