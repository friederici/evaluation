#!/usr/bin/env python3
import os
import sys
import zipfile
import pandas as pd
import matplotlib.pyplot as plt


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
    makespandict = {}
    for zipfilename in get_file_in_folder(foldername, 'zip'):
        csv = get_csv_from_zip(zipfilename)
        #print(csv)
        txt = get_txt_from_zip(zipfilename)
        #print(txt)
        makespan = int( extract_data(txt, 'makespan: ').split()[0] )
        observations = int( extract_data(txt, 'total observations collected: ') )
        #print(f"{observations} {makespan}")
        makespandict[observations] = makespan
    return makespandict


def main():
    print("Makespan analysis\n")
    if len(sys.argv) < 2:
        print(f"usage: {sys.argv[0]} <pathname>")
        exit(1)
    print(sys.argv[1])
    foldername = sys.argv[1]
    if os.path.isfile(foldername):
        print(f"ignore file {foldername}")
    elif os.path.isdir(foldername):
        makespandict = get_makespan_list(foldername)
        print(makespandict)

        df = pd.DataFrame.from_dict(makespandict, orient='index')
        print(df)
        df.reset_index().plot(kind='scatter', x='index', y=0)
        plt.title('makespan')
        plt.show()


if __name__ == "__main__":
    main()
