# CrossSimulator
A repository demonstrating how to simulate recombination in a diploid. This code can be used to simulate alternative haplotypes from a genome assembly and then simulate progeny. The final stage will simulate next generation sequencing reads.\

## Prerequisites
The following software are required to complete this analysis:\
BBMAP\
SAMtools\
BEDtools2\
In addition, an input chromosome-scale genome assembly is required. It is recommended to exclude smaller, non-chromosomal scaffolds.

## Simulating alternative haplotypes.
mutate.sh (from BBMAP) is used to simulate haplotypes.\
`id` can be used to alter heterozygosity of the simulated haplotype. If simulating two alternative haplotypes, then heterozygosity should be set to a fraction of the desired\
	(i.e. for 1% haplotype A may be 0.5%, haplotype B 0.5%, or A may be 0.9%, B 0.1%).\
`maxindel` can be used to set max indel length.
```
#To simulate two haplotypes 0.1% apart from one another:
mutate.sh in=[InputAssembly.fna] out=[OutputAssembly_HapA.fna] maxindel=1000 id=0.9995
mutate.sh in=[InputAssembly.fna] out=[OutputAssembly_HapB.fna] maxindel=1000 id=0.9995
```

## Simulate parental reads.
randomreads.sh (from BBMAP) can be used to simulate reads.\
`coverage` is used to generate the desired coverage. Note, if as above a diploid genome assembly has been generated (HapA+HapB) the coverage should be per haplotype (i.e. `coverage=5` will generate 10x coverage when mapped to a consensus assembly).
```
#To simulate 10x coverage of the previously simulate genotypes:
#Rename records in each assembly using sed and combine into a single fasta file with cat.
#For compatibility with latter steps, please do not change "HapA_" or "HapB_".
cat <(sed 's/>/>HapA_/g' [OutputAssembly_HapA.fna]) <(sed 's/>/HapB_/g' [OutputAssembly_HapB.fna]) > ParentAB.fna
randomreads.sh ref=ParentAB.fna coverage=5 paired=true out=ParentAB.fq.gz
```

## Simulate cross overs.
mutate.sh has generated unique assemblies, so each time the length will change. The shell script MakeRecombSim.sh will generate a unique R script for each input assembly.
```
#Make fasta indices to obtain unique lengths of records.
samtools faidx [OutputAssembly_HapA.fna]
samtools faidx [OutputAssembly_HapB.fna]

#Obtain lengths and add code to Rscript
awk '{print "Ref"++i"max <- "$2}' [OutputAssembly_HapA.fna].fai > RecombSim.R
awk '{print "Alt"++i"max <- "$2}' [OutputAssembly_HapB.fna].fai >> RecombSim.R

#Add lines to randomly determine which haplotype is inherited at coordinate 1 and how many cross-overs are simulated per chromomsome.
awk '{print "PR"++i" <- round(runif(1,min=1,max=2),digits=0)"}' [OutputAssembly_HapA.fna].fai >> RecombSim.R
awk '{print "R"++i" <- round(runif(1,min=1,max=2),digits=0)"}' [OutputAssembly_HapA.fna].fai >> RecombSim.R

#Determine which scaffold is smallest. This will be used to calculate the maximum crossover coordinate.
join [OutputAssembly_HapA.fna].fai [OutputAssembly_HapB.fna].fai | tr ' ' '\t' | cut -f 1,2,6 | awk '{if ($2 > $3) print ++i, $1, "Alt"; else print ++i, $1, "Ref"}' > ScaffComp.txt

#Loop through the scaffolds adding lines to the Rscript
while read -r line ; do input="$line" ; ./MakeRecombSim.sh $line ; done < ScaffComp.txt >> RecombSim.R

#Loop through progeny simulating recombination, synthesizing genomes and genetating reads.
#Reccomended to save files in a new directory.
mkdir -p Prog_tmp
mkdir -p Prog

for P in {1..100} ; do
Rscript RecombSim.R &> Prog_tmp/Prog$P.bed

#Simulate haplotypes, remove fasta headers which don't begin scaffolds.
bedtools getfasta -fi ParentAB.fna -bed Prog_tmp/Prog$P.bed | \
awk '{if ($0 ~ /^>.*:0/)print; else if ($0 !~/>Hap/) print}' | \
cat - [InputAssembly.fna] | \
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' | sed '/^$/d' > Prog_tmp/Prog$P.fna

#Generate random reads on diploid progeny assembly. Set coverage to half of desired as it is generating per haplotype.
randomreads.sh ref=Prog_tmp/Prog$P.fna out=Prog/Prog$P.fq.gz coverage=5 paired=true

#Remove intermediate assembly to save disk space
rm Prog_tmp/Prog$P.fna

done
```
