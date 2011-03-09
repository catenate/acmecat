#!/dis/sh
exec = $1
ecpl = `{echo $exec | sed 's,\.exec$,.ecpl,'}
flag x +
pos ec-perl $ecpl
