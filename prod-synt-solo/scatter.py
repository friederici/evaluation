#!/usr/bin/env python3
import os
import sys
import zipfile
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path


def extract_data(data, search):
    start_index = data.find(search)
    end_index = data.find('\n', start_index)
    return data[start_index+len(search):end_index]


def get_txt_from_zip(zipfilename):
    #print(zipfilename)
    with zipfile.ZipFile(zipfilename) as z:
        for filename in z.namelist():
            if filename.endswith('txt') and filename.startswith('TaskScaler'):
                with z.open(filename, 'r') as f:
                    return f.read().decode()


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


def get_makespan_list(foldername):
    makespanlist = []
    for zipfilename in get_file_in_folder(foldername, 'zip'):
        csv = get_csv_from_zip(zipfilename)
        #print(csv)
        txt = get_txt_from_zip(zipfilename)
        if (not isinstance(txt, str)):
            print(f"type mismatch: {zipfilename}")
            exit(1)
        #print(txt)
        makespan = int( extract_data(txt, 'makespan: ').split()[0] )
        observations = int( extract_data(txt, 'total observations collected: ') )
        input_size = int( extract_data(txt, 'inputSize  : cnt ').split(',')[0] )
        success = int( extract_data(txt, 'success count: ') )
        if (success != input_size):
            print(f"success != input_size {zipfilename}")
            exit(1)
        #print(f"{observations} {makespan}")
        makespanlist.append( [input_size, makespan] )
    return makespanlist


def analyse_folder(foldername):
    predictor_name = Path(foldername).parts[-1]
    if os.path.isfile(foldername):
        print(f"ignore file {foldername}")
    elif os.path.isdir(foldername):
        makespanlist = get_makespan_list(foldername)
        #print(makespanlist)
        #print(foldername.split('\\')[1])
        df = pd.DataFrame(makespanlist, columns=['Observations',predictor_name])
        #print(df)
        return df


def main():
    cwd = Path.cwd().parts[-1]
    print("Makespan analysis -> scatterplot\n")
    if len(sys.argv) < 2:
        print(f"usage: {sys.argv[0]} <pathname(s)> ...")
        exit(1)
    dataframes = []
    for i in range(1, len(sys.argv)):
        #print(sys.argv[i])
        df = analyse_folder( sys.argv[i] )
        dataframes.append(df)

    #fig = plt.figure()
    
    markers = ['o','*','+','x', 'v']
    for i in range(0, len(dataframes)):
        cname = dataframes[i].columns[1]
        #print(dataframes[i]["Observations"])
        #print(dataframes[i][cname])
        plt.scatter(dataframes[i]['Observations'], dataframes[i][cname], marker=markers[i], label=cname)

    plt.title(f"{cwd} makespan in ms")
    plt.xlabel("input size")
    plt.legend()
    #plt.show()
    plt.savefig(f"{cwd}-scatter.png")


if __name__ == "__main__":
    main()
