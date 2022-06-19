#!/bin/sh
#SBATCH -p cubric-default
#SBATCH -o MATLAB_%j.out
#SBATCH -e MATLAB_%j.err

#SUBJECTS=/home/c1549057/Desktop/script/martyna/SUBJECTS;
#dir=/home/c1549057/Desktop/script/martyna;
#wd=/home/c1549057/Desktop/script/martyna;
SUBJECTS=/cubric/collab/354_sleepms/TerminalScripting/SUBJECTS;
dir=/cubric/collab/354_sleepms/TerminalScripting;
wd=/cubric/collab/354_sleepms/TerminalScripting;

for ID in $(cat ${SUBJECTS});
do echo '#!/bin/sh
#SBATCH -p cubric-default
#SBATCH -o '${ID}'_%j.out
#SBATCH -e '${ID}'_%j.err
ID='${ID}'
dir='${dir}'
cd ${dir};
matlab -nodisplay -nodesktop -r "ModularPipelineBash($ID);quit";' >> ${wd}/${ID}_CLUSTER.sh;
chmod 777 ${wd}/${ID}_CLUSTER.sh;
sbatch ${wd}/${ID}_CLUSTER.sh;
echo ${ID} 'SENT TO CLUSTER';
done 





