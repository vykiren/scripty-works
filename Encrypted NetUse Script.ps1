#User Login Requirements and mount the network path
$pwd = Get-Content "Path to salted login.txt file"
$securePwd = $pwd | ConvertTo-SecureString -AsPlainText -Force
net use x: \\Share\Path /u:Domain\User $credential.GetNetworkCredential().Password #Remember to call the credentials var first specified in the salted login.txt file

#Un-Mount the drive instance
net use /del x:
