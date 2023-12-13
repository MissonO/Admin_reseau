$Script1Path = "C:\\Users\Administrator\Desktop\scripts\createNewUserCsv.ps1"
$Script2Path = "C:\\Users\Administrator\Desktop\scripts\deactivateUserCsv.ps1"

$CSV1Path = "\\127.31.240.1\hr_partage\creation.csv"
$CSV2Path = "\\127.31.240.1\hr_partage\suppression.csv"

Invoke-Expression -Command "& `"$Script1Path`" -CSVPath `"$CSV1Path`"
Invoke-Expression -Command "& `"$Script2Path`" -CSVPath `"$CSV2Path`"
