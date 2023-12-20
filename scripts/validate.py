#!/usr/bin/env python3
import os
import sys
import zipfile
from pathlib import Path
import colorama
from colorama import Fore, Style


def validate_nextflow_log(content):
    print("--- validate_nextflow_log ---")
    start = content.find("nextflow.trace.WorkflowStatsObserver")
    end = content.find("\n", start)
    workflow_completed = content[start:end]
    print(workflow_completed)
    if not "Workflow completed" in workflow_completed:
        print(f"missing Workflow completed")
        return False
    return True


def validate_TaskScaler_csv(content):
    print("--- validate_TaskScaler_csv ---")
#    print(content)


def validate_TaskScaler_txt(content):
    print("--- validate_TaskScaler_txt ---")
#    print(content)


def validate_nextflow_trace(content):
    print("--- validate_nextflow_trace ---")
#    print(content)


def validate_zip(zippath):
    print(f"validate_zip({zippath})")
    taskscalertxt = None
    taskscalercsv = None
    nextflowlog = None
    nextflowtrace = None
    with zipfile.ZipFile(zippath) as z:
        for filename in z.namelist():
            if filename.endswith('txt') and filename.startswith('TaskScaler'):
                with z.open(filename, 'r') as f:
                    taskscalertxt = f.read().decode()
            elif filename.endswith('csv') and filename.startswith('TaskScaler'):
                with z.open(filename, 'r') as f:
                    taskscalercsv = f.read().decode()
            elif filename.endswith('log') and filename.startswith('.nextflow'):
                with z.open(filename, 'r') as f:
                    nextflowlog = f.read().decode()
            elif filename.endswith('txt') and filename.startswith('trace'):
                with z.open(filename, 'r') as f:
                    nextflowtrace = f.read().decode()
    if taskscalertxt == None:
        print(f"error: missing TaskScaler.txt in {zippath}")
        exit(1)
    if taskscalercsv == None:
        print(f"error: missing TaskScaler.csv in {zippath}")
        exit(1)
    if nextflowlog == None:
        print(f"error: missing .nextflow.log in {zippath}")
        exit(1)
    if nextflowtrace == None:
        print(f"{Fore.YELLOW}warning: missing trace.txt{Style.RESET_ALL} in {zippath}")
        #exit(1)
    validate_TaskScaler_csv(taskscalercsv)
    validate_TaskScaler_txt(taskscalertxt)
    if not validate_nextflow_log(nextflowlog):
        print(f"validation error in {zippath}: \n{nextflowlog}")
        exit(1)
    validate_nextflow_trace(nextflowtrace)


def get_file_in_folder(path, extension):
    files_list = []
    for f in os.listdir(path):
        if f.endswith(extension):
            files_list.append(os.path.join(path,f))
    return files_list


def validate_folder(folder):
    print(f"validate_folder({folder})")
    if os.path.isfile(folder):
        print(f"error, that is a file: {folder}")
        exit(1)
    elif not os.path.isdir(folder):
        print(f"error, that is not a folder: {folder}")
        exit(1)
    elif os.path.isdir(folder):
        for zippath in get_file_in_folder(folder, 'zip'):
            validate_zip(zippath)
        return
    else:
        print(f"error, unknows reason: {folder}")
        exit(1)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(f"usage: {sys.argv[0]} <pathname(s)> ...")
        exit(1)
    for i in range(1, len(sys.argv)):
        validate_folder( sys.argv[i] )
    print(f"--- {Fore.GREEN}validation successful{Style.RESET_ALL} ! ---")

