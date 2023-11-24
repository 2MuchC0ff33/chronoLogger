@echo off
set log_file=timeLog.csv
set /a task_number=1

:start_task
set /p task_name=Enter the task name:
set start_time=%time%
set start_date=%date%
echo %task_number%,%task_name%,%start_date%,%start_time%,, >> %log_file%
echo Task started: %task_name% at %start_time% on %start_date%
pause
:pause_task
set /a task_number+=1
set /p choice=Enter 'resume' to resume or 'finish' to finish the task:
if /i "%choice%"=="resume" goto resume_task
if /i "%choice%"=="finish" goto finish_task
goto pause_task

:resume_task
set resume_time=%time%
echo Task resumed at %resume_time%
pause
goto pause_task

:finish_task
set finish_time=%time%
set finish_date=%date%
echo Task finished at %finish_time% on %finish_date%
echo ,,%finish_date%,%finish_time% >> %log_file%
echo Task completed: %task_name%
