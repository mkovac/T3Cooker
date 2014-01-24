for s in `cat samples | grep -v "#"`; do  t3cooker -c $s $1 $2; done
