echo off

::Get num of jobs you want to print
set /p input="How many times should I say hello?"

::Starts at 1, steps by one, and finishes at 100.
for /l %%x in (1, 1, %input%) do (
   echo Hello
)

echo All done...
pause