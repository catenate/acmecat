#!/dis/sh
pl = $1
out = `{pos perl $pl}
if {! ~ $out 'EDT'} {status 'match failed'} {exit}
