#!/usr/bin/env python3
import os
import sys
import zipfile
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path
import matplotlib.ticker as ticker
from matplotlib.axis import Axis
import statistics
from itertools import chain
import numpy as np


def get_csv_from_zip(zipfilename):
    #print(zipfilename)
    with zipfile.ZipFile(zipfilename) as z:
        for filename in z.namelist():
            if filename.endswith('csv'):
                with z.open(filename) as f:
                    return pd.read_csv(f)
    

def get_file_in_folder(path, extension):
    files_list = []
    for f in os.listdir(path):
        if f.endswith(extension):
            files_list.append(os.path.join(path,f))
    return files_list


def get_csv_list(foldername):
    csvlist = []
    for zipfilename in get_file_in_folder(foldername, 'zip'):
        csv = get_csv_from_zip(zipfilename)
        csvlist.append(csv)
    return csvlist
    

def analyse_folder(foldername):
    if os.path.isfile(foldername):
        print(f"ignore file {foldername}")
    elif os.path.isdir(foldername):
        csvlist = get_csv_list(foldername)
        return csvlist


def main():
    cwd = Path.cwd().parts[-1]
    print()
    if len(sys.argv) < 2:
        print(f"usage: {sys.argv[0]} <pathname(s)> ...")
        exit(1)
    csvdict = {}
    for i in range(1, len(sys.argv)):
        predictor_name = Path(sys.argv[i]).parts[-1]
        csvlist = analyse_folder( sys.argv[i] )
        csvdict[predictor_name] = csvlist

    #print(csvdict)

    print("Predictor & node1 & node2 & node3 & node4 & min & avg & max \\\\ \\hline \\hline")
    for key in csvdict.keys():
        num_node1 = 0;
        num_node2 = 0;
        num_node3 = 0;
        num_node4 = 0;
        ramRequest = []
        for i in range(0, len(csvdict[key])):
            df = csvdict[key][i]
            num_node1 += len(df[df['node'] == 'node1'])
            num_node2 += len(df[df['node'] == 'node2'])
            num_node3 += len(df[df['node'] == 'node3'])
            num_node4 += len(df[df['node'] == 'node4'])
            ramRequestSucc = df[df['success']==True]['ramRequest'].to_list()
            ramRequest.append(ramRequestSucc)
        ramRequestFlat = list(chain(*ramRequest))
        print(key, end = ' & ')
        print(num_node1, end = ' & ')
        print(num_node2, end = ' & ')
        print(num_node3, end = ' & ')
        print(num_node4, end = ' & ')
        print("{:,.0f}".format(min(ramRequestFlat)/(1024*1024)), end = ' & ')
        print("{:,.0f}".format(np.mean(ramRequestFlat)/(1024*1024)), end = ' & ')
        print("{:,.0f}".format(max(ramRequestFlat)/(1024*1024)), end = ' ')
        print(' \\\\ \\hline')

if __name__ == "__main__":
    main()
