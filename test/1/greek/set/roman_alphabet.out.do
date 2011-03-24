#!/dis/sh
out = $1
in = `{echo $out | sed 's,\.out$,.in,'}
cat $in | greek > $out
echo $out
