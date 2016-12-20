#/bin/bash

file=ODM_stats_default.txt
bench=stats_benchmark.txt
path=$1
echo -e "/****************************" > $file
echo -e "/*" >> $file
echo -e "/*       Running ODM with default setting" >> $file
echo -e "/*" >> $file
echo -e "/****************************" >> $file
echo -e " " >> $file

for i in {0..29}
do
	sleep 1
	python run.py --time --resize-to 1280 --min-num-features 2000 --project-path $path
	sleep 5
	echo -e "*-*-*-$i" >> $file
	cat $path$bench >> $file
	echo -e " " >> $file
	sleep 3
	bash clean_test.sh
done
