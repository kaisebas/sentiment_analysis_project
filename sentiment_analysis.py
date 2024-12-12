# -*- coding: utf-8 -*-
"""
Created on Fri Dec  6 22:27:28 2024

@author: 0eter
"""

#Import all necessary stuff
import nltk
#nltk.download('all')
import math
from nltk.sentiment.vader import SentimentIntensityAnalyzer
sia = SentimentIntensityAnalyzer()


def analyzer():
    #get text file
    textfile = input("please type in file name: ")
    while textfile != 'end':
        
        with open(textfile, 'r') as file:
            text = file.read()

        #get the score
        sia_score = sia.polarity_scores(text)
        neg = sia_score['neg']
        pos = sia_score['pos']
        neu = sia_score['neu']
        comp = sia_score['compound']
        
        print(f"neg: {neg}")
        print(f"pos: {pos}")
        print(f"neu: {neu}")
        print(f"comp: {comp}")
        
        textfile = input("another file?: ")

def main():
        analyzer()

main()
