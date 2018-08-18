::Windows batch file used to print multiple test pages using a local printer
::by first mapping a network printer to a local port.

::Make sure the selected printer is shared on the network and the name of the shared printer is changed to 'PawPrint' before executing
::this script.

::Make sure the test file is a txt file saved to the same default PWD as this 
::executable and named test.txt before executing this script.

::Save this text file as a cmd file and send it to the desktop for easy access.
::Make sure the script file and the test file are in the same directory.

::Make sure the PawPrint UNI-client is downloaded on the user's account.

::Make sure the name of the current Windows user's name is identical to the UNI 
::associated with the PawPrint queue.

::@author CloudStrife

echo off
::Get num of jobs user wants to print
set /p input="How many test pages do you want to send to your PawPrint queue?"

::Map the Columbia University PawPrint network printer to local printer port lpt1
::Limit the mapping to this session
echo off
echo Mapping PawPrint to lpt1 port
net use lpt1 \\%COMPUTERNAME%\PawPrint /persistent:no

::Print out the name of the current user on the test.txt file 50 times, followed by a few blank lines
::to cover at least 2 pages
echo Populating text file with name of the current user
echo ...

::Starts at 1, steps by one, and finishes at 50.
echo %USERNAME% > test.txt
echo.>> test.txt
for /l %%x in (1, 1, 50) do (
	echo %USERNAME% >> test.txt
	echo.>> test.txt
)

::Now specify the print device you want to use and the file you
::want to print. Repeat this to send double-sided test pages to your PawPrint queue according to the user's input quantity.
echo Sending your test pages to the queue
echo ...

::Starts at 1, steps by one, and finishes at amount specified by user input.
for /l %%x in (1, 1, %input%) do (
   print /d:lpt1 test.txt
)

echo ...
echo All done!
pause
