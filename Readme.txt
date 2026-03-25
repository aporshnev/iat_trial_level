Readme.txt
Step_0 - Adding all packages to the quarto project environment. Without it quarto would not find them. Need to uncomment all .add  and run once 
> quarto render step_00_add_packages.qmd

Step_01 - Splitting sample into A,B session wise (one session = participant belong to only one sample A or B).\
Stratified by country UK, US. Works with clean data raw data in compressed arrow format\
it requires structure to be following:
/in_Control/NSyllabus_check.csv, ukwac_freq.csv, subtitles_freq.csv, bnc_freq.csv
/Out/<Random_seed>/AB_split
> quarto render step_01_sample_split.qmd

NOTE: This random split took about 5 hours!

Step_02 - Running all analysis: first model preset baseline, next add language feature and compare model with feature with baseline models and collect statistics (output: results.csv)\
Creates report with standard print for models step_02.html and html file with models and summary table render.html (by default)
it requires structure to be following:
/in_Distances/all/filename.csv
/Out/<Random_seed>/AB_split/<year>-A<Random_seed>.arrow, <year>-B<Random_seed>.arrow

> quarto render step_02_modelling.qmd
NOTE: This script requre distance data from language models and control data 
NOTE: Moddelling 474 models will take approx 26 hours for 2019 year
