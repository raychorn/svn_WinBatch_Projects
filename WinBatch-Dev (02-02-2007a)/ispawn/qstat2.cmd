
qstat -raw ` -t2m,status=dedicated,regions=0x3f 63.251.143.245:27999 > qstat2.txt

qstat -raw ` -t2m,status=dedicated,regions=0x3f 63.251.143.246:27999 >> qstat2.txt

qstat -raw ` -t2m,status=dedicated,regions=0x3f 64.94.105.141:27999 >> qstat2.txt

qstat -raw ` -t2m,status=dedicated,regions=0x3f 64.94.105.145:28000 >> qstat2.txt

qstat -raw ` -t2m,status=dedicated,regions=0x3f 203.108.8.212:28002 >> qstat2.txt

qstat -raw ` -t2m,status=dedicated,regions=0x3f 211.233.32.77:28002 >> qstat2.txt

qstat -raw ` -t2m,status=dedicated,regions=0x3f 213.221.174.226:28002 >> qstat2.txt
