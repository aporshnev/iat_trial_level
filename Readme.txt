Readme.txt

Step_0 - Adding all packages to the quarto project environment. Without it quarto would not find them. Need to uncomment all .add  and run once 
> quarto render step_00_add_packages.qmd
Step_01 - Splitting sample into A,B session wise (one session = participant belong to only one sample A or B).\
Stratified by country UK, US. Works with clean data raw data in compressed arrow format\
> quarto render step_01_sample_split.qmd

Step_02 - Running all analysis: first model preset baseline, next add language feature and compare model with feature with baseline models and collect statistics (output: results.csv)\
Creates report with standard print for models step_02.html and html file with models and summary table render.html (by default)
> quarto render step_02_modelling.qmd
NOTE: This script requre distance data from language models and control data 
