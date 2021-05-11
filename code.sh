module load bioinfo-tools
module load FastQC/0.11.8
module load bwa/0.7.17
module load samtools/1.10
module load GATK/4.1.4.1

cd /home/kangwang/WES/reference
ln -s /sw/data/igenomes/Homo_sapiens/Ensembl/GRCh37/Sequence/WholeGenomeFasta/genome.fa

cd /home/kangwang/WES/data
for i in /proj/sens2019581/data/WES_promix/*
do ln -s $i   #创建数据链接 ln
done

salloc -A sens2019581 -t 04:00:00 -p core -n 1 --no-shell --reservation=sens2019581 &

bwa index -a bwtsw /home/kangwang/WES/reference/genome.fa