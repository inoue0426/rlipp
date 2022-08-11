#!/bin/bash

homedir='../graph_neural_network_drug_response/notebook/DrugCell/data/'
ontology="${homedir}drugcell_ont.txt"
gene2idfile="${homedir}gene2ind.txt"
cell2idfile="${homedir}cell2ind.txt"
cell_mutation="${homedir}cell2mutation.txt"
test="${homedir}test_rcell_over50_not_equal.txt"

modeldir='/export/scratch/inoue019/'
predicted="${modeldir}Result_157/drugcell.predict"
output="${modeldir}/rlipp.out"
hidden="${modeldir}Hidden_157"

cpu_count=30

neurons=5

/export/scratch/inoue019/envs/cluster/bin/python -u /home/inoue019/code/rlipp/src/rlipp_helper.py -hidden $hidden -ontology $ontology -test $test  \
	-gene2idfile $gene2idfile -cell2idfile $cell2idfile -cell_mutation $cell_mutation -output $output \
	-predicted $predicted -cpu_count $cpu_count -drug_count 0 -genotype_hiddens $neurons > "${modeldir}/rlipp.log"
