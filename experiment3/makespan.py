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
    makespanlist = []
    for zipfilename in get_file_in_folder(foldername, 'zip'):
        csv = get_csv_from_zip(zipfilename)
        #print(csv)
        txt = get_txt_from_zip(zipfilename)
        #print(txt)
        makespan = int( extract_data(txt, 'makespan: ').split()[0] )
        observations = int( extract_data(txt, 'total observations collected: ') )
        #print(f"{observations} {makespan}")
        makespanlist.append( [observations, makespan] )
    return makespanlist


def analyse_folder(foldername):
    if os.path.isfile(foldername):
        print(f"ignore file {foldername}")
    elif os.path.isdir(foldername):
        makespanlist = get_makespan_list(foldername)
        #print(makespanlist)
        #print(foldername.split('\\')[1])
        df = pd.DataFrame(makespanlist, columns=['Observations',foldername.split('\\')[1]])
        #print(df)
        return df


def main():
    print("Makespan analysis\n")
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

    plt.title('makespan in ms')
    plt.legend()
    #plt.show()
    plt.savefig('experiment3.png')


if __name__ == "__main__":
    main()
