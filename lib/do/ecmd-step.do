#!/dis/sh
stepfile = $1
ecmd = `{echo $stepfile | sed 's,\.step$,.ecmd,'}
(project procedure stepname) = `{sed -n '1p' $ecmd | sed 's,^# ,,;s,-,,g'}
if {echo pos ectool modifyStep $project $procedure $stepname --commandFile $ecmd} {
	cp $ecmd $stepfile
	echo $stepfile
}
