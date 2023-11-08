module load stacks-gcc7/2.41

## start analysis
perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples fastq_files --popmap Simulium.popmap -o stacks_denovo1 -d --paired

## pull out Simulium damnosum

cat Simulium.popmap | grep -v "Ab" | grep -v "Bb" | grep -v "Cb"|grep -v "Db"|grep -v "Eb" | grep -v "Fb" > Simulium_damnosum.popmap

grep -c "SIM" Simulium_damnosum.popmap

## 151

cat Simulium.popmap | grep -v "Ad" | grep -v "Bd" | grep -v "Cd"|grep -v "Dd"|grep -v "Ed" | grep -v "Fd" > Simulium_bovis.popmap

grep -c "SIM" Simulium_bovis.popmap

## 41

## remove reads that are less than 100bp

## I wrote a perl script that would do this; I'm testing to see how long it takes to do a file tho

--> get perl script


## files have been renamed tP1-... and moved to tfastq_files; popmap is updated

 cat Simulium_damnosum.popmap | awk '{print "t" $_}' >tSimulium_damnosum.popmap
 
## using awk to trim the reads so they are all the same length

zcat tP2-P02-H12-WILDING-2-SIM-221.2.fastq.gz | awk '{print substr($0,1,100)}' > ttP2-P02-H12-WILDING-2-SIM-221.2.fastq
gzip ttP2-P02-H12-WILDING-2-SIM-221.2.fastq

## run analysis

perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum.popmap -o damnM1 --paired --rm-pcr-duplicates -M 1 -n 1

grep "Final coverage" denovo_map.log

# Identified individual flies with a coverage less than 10 and remove from analysis (n = 14)
# Run script with M 1 through 8 to identify optimal M

perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum_cov10.popmap -o damnM1 --paired --rm-pcr-duplicates -M 1 -n 1
perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum_cov10.popmap -o damnM2 --paired --rm-pcr-duplicates -M 2 -n 2
perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum_cov10.popmap -o damnM3 --paired --rm-pcr-duplicates -M 3 -n 3
perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum_cov10.popmap -o damnM4 --paired --rm-pcr-duplicates -M 4 -n 4
perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum_cov10.popmap -o damnM5 --paired --rm-pcr-duplicates -M 5 -n 5
perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum_cov10.popmap -o damnM6 --paired --rm-pcr-duplicates -M 6 -n 6
perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum_cov10.popmap -o damnM7 --paired --rm-pcr-duplicates -M 7 -n 7
perl /usr/local/stacks/2.41-gcc7/bin/denovo_map.pl --samples ttfastq_files --popmap ttSimulium_damnosum_cov10.popmap -o damnM8 --paired --rm-pcr-duplicates -M 8 -n 8

cat popdamnM1/populations.hapstats.tsv | awk '{if ($4 == "Gd") print $6}' | grep -c "1"

# Ran population statistics and output files for M = 4 and p = 6 (loci have to be in all populations)

populations -P damnM4 -O m4pop -M ttSimulium_damnosum_cov10.popmap -p 6 -r 0.8 --structure