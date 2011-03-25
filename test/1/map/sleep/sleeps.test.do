#!/dis/sh
test = $1
out = `{echo $test | sed 's,\.test$,.out,'}
redo clean sleeps > $test
flag x +
diff $out $test
