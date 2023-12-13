Import-Module ActiveDirectory

function createNewUserCsv {
  param(
    [string]$csvPath
  )

  if (-not (Test-Path $csvPath)) {
    Write-Error "CSV file not found at $csvPath"
    return
  }

  $userData = Import-Csv $csvPath

  foreach ($userData in $userData) {
    $username = $userData.Username

    try {
     Disable-ADAccount -Identity $username -ErrorAction Stop

      Write-Output "User bloqué $username"
    } catch {
      Write-Error "Error deactivating user : $_"
    }
  }
}
