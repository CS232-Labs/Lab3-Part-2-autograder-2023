#! /bin/bash

results="results.csv"

# echo "RollNumber,InCorrect1,Time1,InCorrect2,Time2,InCorrect3,Time3" > $results
# printf "RollNumber" > $results
# for i in 10000 100000 1000000 10000000
# do
#     printf ",InCorrect_0.5_$i,Time_0.5_$i" >> $results
# done
# for i in 10000 100000 1000000 10000000
# do
#     printf ",InCorrect_1_$i,Time_1_$i" >> $results
# done
# echo "" >> $results

cd code_files
gcc time_job.c -o time_job
# Can comment this out if the files already exist
#################################################
g++ test_creator.cpp
for i in 10000 100000 1000000 10000000
do
    ./a.out $i 0.5 42
    mv input.txt input_0.5_$i.txt
    mv correct_output.txt correct_output_0.5_$i.txt
done
for i in 10000 100000 1000000 10000000
do
    ./a.out $i 1 69
    mv input.txt input_1_$i.txt
    mv correct_output.txt correct_output_1_$i.txt
done
rm a.out
#################################################
cd ..

i=$1
echo ==================== Starting $i ====================
cd $i
cp ../code_files/* .
make
if [ $? -ne 0 ]; then
    cd ..
    continue
fi

printf "$i" >> ../$results
for j in 10000 100000 1000000 10000000
do
    ttime=`./time_job ./main c input_0.5_$j.txt ${i}_out_0.5_$j.txt`
    ex=$?
    # diffnum=`diff -q correct_output_0.5_$j.txt ${i}_out_0.5_$j.txt | wc -l`
    diff -q correct_output_0.5_$j.txt ${i}_out_0.5_$j.txt
    diffnum=$?
    if [ $ex -ne 0 ]; then
        diffnum="segfault"
    fi
    printf ",$diffnum,$ttime" >> ../$results
done
for j in 10000 100000 1000000 10000000
do
    ttime=`./time_job ./main c input_1_$j.txt ${i}_out_1_$j.txt`
    ex=$?
    # diffnum=`diff -q correct_output_1_$j.txt ${i}_out_1_$j.txt | wc -c`
    diff -q correct_output_1_$j.txt ${i}_out_1_$j.txt
    diffnum=$?
    if [ $ex -ne 0 ]; then
        diffnum="segfault"
    fi
    printf ",$diffnum,$ttime" >> ../$results
done
echo "" >> ../$results

for j in ../code_files/*
do
    f=`echo $j | cut -d '/' -f 3`
    # rm $f 2&>/dev/null
done
cd ..
echo ==================== Finished $i ==================== 

