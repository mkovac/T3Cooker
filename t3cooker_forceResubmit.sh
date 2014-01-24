#bash t3cooker_find.sh Aborted; 
bash t3cooker_find.sh $1;
bash special_t3cooker_jobs.sh --kill; 
bash special_t3cooker_jobs.sh --status; 
bash special_t3cooker_jobs.sh --submit
