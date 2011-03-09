#!/dis/sh
sed = $1
ecmd = `{echo $sed | sed 's,\.ecpl.sed$,.ecmd,'}
ecvar = `{ecvar $ecmd}
rm -f $sed
apply {
	spaced = $1
	space = `{echo $spaced | sed 's,␣, ,g'}
	echo 's,\$\[' $space '\],,g' | sed 's,\\\[ ,\\[,;s, \\\],\\],' >> $sed
} $ecvar
echo $sed
