# Autograder (Lab 3, Part 2)

- To use this autograder, clone this directory, create a new subdirectory of it, and run the command ```./autograder.sh <directory name>```

- You should see your results in ```results.csv```. The first column denotes the name of your directory and the remaining pairs of consecutive columns denote correctness, time taken for each test case. If the code runs correctly, the correctness column will display 0, else it displays 1 (if the answer doesn't match the expected answer or the time limit was exceeded) or "segfault" (for code that runs into a segmentation fault or other issues that lead to it being killed by the OS). The time taken column denotes the time taken (in milliseconds) for the code to run, and contains "TLE" if the time limit was exceeded.

- The time limit is 20 seconds.

- The breakup of marks is - 2.5 marks for each test case of size ```10000```, 5 marks for each test case of size ```100000```, 7.5 marks for each test case of size ```1000000``` and 10 marks for each test case of size ```10000000```. There are two test cases of each size. 
