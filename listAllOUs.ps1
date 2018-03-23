#This script is used to print all of the OUs in the domain

Write-Output "Printing out a list of all the OUs..."
Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name, DistinguishedName -A

Write-Output "All done..."
Read-Host -Prompt "Press Enter to continue"
