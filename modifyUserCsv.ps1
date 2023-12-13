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
    $attribute = $userData.Attribute
    $newValue = $userData.NewValue

    try {
      Set-ADUser -Identity $username -$attribute $newValue -ErrorAction Stop

      Write-Output "User modifé $username"
    } catch {
      Write-Error "Error modifying user : $_"
    }
  }
  }
