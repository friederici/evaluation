# evaluation
This repository contains the experimental results of my bachelor’s thesis. Additionally, it contains the scripts used to create the visuals and tables in the evaluation.

## Contents 

### Experiments, as referenced in the thesis

| Reference    | Path                               |
|--------------|------------------------------------|
| Experiment 1 | [./6GB-0.5CPU/prod-synt-solo-2/](https://github.com/friederici/evaluation/tree/main/6GB-0.5CPU/prod-synt-solo-2)     |
| Experiment 2 | [./6GB-0.5CPU/prod-synt-comb-2/](https://github.com/friederici/evaluation/tree/main/6GB-0.5CPU/prod-synt-comb-2)     |
| Experiment 3 | [./6GB-0.5CPU/prod-synt-box-solo-2/](https://github.com/friederici/evaluation/tree/main/6GB-0.5CPU/prod-synt-box-solo-2) |
| Experiment 4 | [./6GB-0.5CPU/prod-synt-box-comb-2/](https://github.com/friederici/evaluation/tree/main/6GB-0.5CPU/prod-synt-box-comb-2) |
| Experiment 5 | [./real-world/prod-rnaseq/](https://github.com/friederici/evaluation/tree/main/real-world/prod-rnaseq)          |

### Scripts

| Script                 | Usage                                              |
|------------------------|----------------------------------------------------|
| ./scripts/boxplot.py   | Creates the boxplots                               |
| ./scripts/comparison.py| Creates the table for median makespan comparison   |
| ./scripts/nodes.py     | Creates the table for the cluster/node usage       |
| ./scripts/scatter.py   | Creates the scatterplot with linear regression line|
| ./scripts/summary.py   | Creates the table for failes/successful tasks      |

## References

Workflows: https://github.com/friederici/workflows

CWS-fork: https://github.com/friederici/KubernetesScheduler

## Bonus content

### [./4GB-1CPU/](https://github.com/friederici/evaluation/tree/main/4GB-1CPU)

The results of initial experiments that we conducted with the following process configuration:

    cpus 1
    memory { 4.GB * task.attempt }

### [./real-world/prod-viralrecon/](https://github.com/friederici/evaluation/tree/main/real-world/prod-viralrecon)

The results of another real-world workflow, not discussed in the thesis.
