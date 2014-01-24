#!/bin/bash

#export SCRAM_ARCH=MY_SCRAM_ARCH
#export CMSSW_BASE=MY_CMSSW_BASE

#these variables are setted-up by t3cooker t3cJobManager::makeJobs
logdir=LOGDIR
logfile=FOUTNAMENOEXT.out
thisjobfileslist=THISJOBFILESLIST
lumimask=LUMIMASK
prefix=PREFIX
jobid=JOBID
executable=EXECUTABLE

OUT=`cat ${thisjobfileslist} | awk -F all/ '{print $2}'`

#Setting up the directory
mkdir -p $logdir/done $logdir/failed

#Setup CMSSW area
voms-proxy-info --all 1>>$logfile 2>&1 ;
echo "Working directory: "$PWD

#change this part to cover your needs
export PATH=$PATH:EXE_DIR
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/contrib/gcc/4.6.2/x86_64-slc5-gcc46-opt/lib64:$LD_LIBRARY_PATH

time ${executable} -fileList ${thisjobfileslist} ${lumimask} OPTIONS -out ${prefix}/${OUT} 1>>$logfile 2>&1 ;

#if the job is done with exit code 0 then print number to file jobs_done
if [ $? = 0 ]; then
touch $logdir/done/$jobid
else
touch $logdir/failed/$jobid
fi