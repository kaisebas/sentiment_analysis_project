# sentiment_analysis_project
Data is divided into 4 main directories:
4 Minute (4min) files
7 Days Before Valentines Day (7days) files
Dead Friend Forever (DFF) files
Word lists

The shows contain separate folders for each website the show has data for. The word list contains folders the tokenizer.sh script output.
Each one has a copy folder available where you can view the already cleaned files.
Tokens is for word lists sorted by frequency. Analysis is for the list that is to be used with the sentiment analysis python script.

There are a total of 4 cleaning scripts, one for each website. They only work for their respective website due to differences in format.
The scripts take 1 directory as an argument. It outputs a clean file to the same directory. Since iQIYI and Reddit are both by individual episodes
there is also an additional output file marked as 'combined' which is a combination of all the episode data cleaned.

The tokenizer script takes 1 cleaned file and out puts two files, one into each folder in the word list directory.

The sentiment analysis python code also takes 1 argument.
