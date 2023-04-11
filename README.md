# OpenConnectSpray

OpenConnectSpray is a PowerShell utility that helps automate the process of testing multiple usernames and passwords against a variety of VPN servers supported by OpenConnect. The script takes a server address, a file containing credentials, and other optional parameters, and performs a connection attempt for each credential set in the file. The output of each connection attempt is then checked for a specific string to determine if the login was successful or not.

# Prerequisites

To use OpenConnectSpray, you need to have the following installed on your system:

* PowerShell 3.0 or higher
* OpenConnect client (the default path is C:\Program Files\OpenConnect\openconnect.exe)

# Usage

To use OpenConnectSpray, follow these steps:

* Clone or download the OpenConnectSpray repository.
* Open a PowerShell console and navigate to the directory where the script is located.
* Run the Invoke-OpenConnectSpray command with the required parameters.

An example:

```powershell
Invoke-OpenConnectSpray -Server vpn.example.com -CredsFile "C:\Users\myuser\credentials.txt"
```

This command will test each set of credentials in the credentials.txt file against the VPN server at vpn.example.com.

You can also specify additional parameters, such as the server certificate, protocol, user agent, and authentication group.

For a full list of available parameters and their descriptions, run the following command:

```powershell
Get-Help Invoke-OpenConnectSpray -Full
```

# Output

OpenConnectSpray will output the results of each connection attempt to the console. The output format is as follows:

Server,Username,Password,RESULT

Where Server is the VPN server address, Username and Password are the credentials being tested, and RESULT is either VALID (if the connection attempt was successful) or FAILED (if the connection attempt failed).

If the -Details parameter is used, OpenConnectSpray will also output the full OpenConnect command that was executed for each connection attempt.

# Contributing

Contributions are welcome by [opening an issue](https://github.com/Macmod/OpenConnectSpray/issues/new) or by [submitting a pull request](https://github.com/Macmod/OpenConnectSpray/pulls).

# Todo

* More options to forward to OpenConnect
* Add option to ustomize output (JSON support)

# License

The MIT License (MIT)

Copyright (c) 2023 Artur Henrique Marzano Gonzaga

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
