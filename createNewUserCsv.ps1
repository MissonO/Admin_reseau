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
    $email = $userData.Email
    $password = $userData.Password

    try {
      New-ADUser -SamAccountName $username -UserPrincipalName "$username@3TL1-6.lab" -Name $username -GivenName $username -Surname "User" -EmailAddress $email -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Enabled $true -ErrorAction Stop

      Write-Output "User créé $username"
    } catch {
      Write-Error "Error creating user : $_"
    }
  }
  }
