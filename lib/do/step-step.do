#!/dis/sh
stepfile = $1
(project procedure stepname) = `{sed -n '1p' $stepfile | sed 's,^# ,,;s,-,,g'}
pos ectool getStep $project $procedure $stepname  | nocr | sed '1,/<broadcast/d;/^<\/command/,$d' | sed '1s, *<command>,,' | sed 's,&amp;,&,g;s,&lt;,<,g;s,&gt;,>,g' > $stepfile
echo $stepfile
