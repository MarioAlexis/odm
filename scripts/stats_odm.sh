#/bin/bash

file=config08.txt
zipfile=config_08.zip
bench=benchmark.txt
path=$1
echo -e "/****************************" > $file
echo -e "/*" >> $file
echo -e "/*       Running Config -- 08 -- " >> $file
echo -e "/*" >> $file
echo -e "/****************************" >> $file
echo -e " " >> $file

for i in {0..29}
do
	if [ $i == 29 ]
	then
		python run.py --time --resize-to 1280 --min-num-features 2000 --odm_meshing-maxVertexCount 100000 --project-path $path
		sleep 5
		echo -e "*-*-*-$i" >> $file
		cat $path$bench >> $file
		echo -e " " >> $file
		sleep 3
		zip $zipfile $file $pathodm_texturing/*.*
		sleep 1
		mv $zipfile /home/ubuntu/
	else
		sleep 1
		python run.py --time --resize-to 1280 --min-num-features 2000 --odm_meshing-maxVertexCount 100000 -s resize -e odm_meshing --project-path $path
		sleep 5
		echo -e "*-*-*-$i" >> $file
		cat $path$bench >> $file
		echo -e " " >> $file
		sleep 3
		bash clean_test.sh $path
	fi
done
