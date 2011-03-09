#!/dis/sh
ecpl = $1
ecmd = `{echo $ecpl | sed 's,\.ecpl$,.ecmd,'}
sed -f $ecpl.sed $ecmd > $ecpl
echo $ecpl
