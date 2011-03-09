#!/dis/sh
sleep = $1
num = `{echo $sleep | sed 's,\.sleep,,'}
load expr
echo '#!/dis/sh' > $sleep
echo echo start $num >> $sleep
echo sleep `{echo ${expr 10 $num -}} >> $sleep
echo echo $num done >> $sleep
chmod +x $sleep
$sleep
