mkdir $out
src=/nix/store/8854jh52mpd8g2rjqk9n2fhifsr20w81-hello-c-multiple
gcc=/nix/store/i31w737kksgxlnnb0ggbaapc5134awrh-gcc
for c in $src/*.c; do
  $gcc -I$src -c -o $c.o $c
done
$gcc -o $out *.o
