#Note: If you are creating a series of login/pwd instances for use in the same script then the variable $credential must be iterated.
#Example
#$credential
#$credential2
#$credential3
#
#Reminder when calling the security login/pwd in your script to call the actual credential variable name.
#
#Process for encrypting a Login/Password object
$userName = 'Domain\User'
$password = 'PWD Here'

$pwdSecureString = ConvertTo-SecureString -Force -AsPlainText $password
$credential = New-Object -TypeName System.Management.Automation.PSCredential `
    -ArgumentList $userName, $pwdSecureString

Set-Content "file save location" $credential
