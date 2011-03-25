#!/dis/sh
pl = $1
out = `{pos perl $pl}
if {! ~ $out '2'} {status 'match failed'} {exit}
