# Set your email server settings
$smtpServer = "<smtp_server_address>"
$smtpPort = <smtp_port>
$smtpUsername = "<your_email_username>"
$smtpPassword = "<your_email_password>"

# Set the sender and recipient email addresses
$senderEmail = "<sender_email@example.com>"
$recipientEmail = "<recipient_email@example.com>"

# Get the public IP address
$publicIP = (Invoke-WebRequest -Uri "http://ipinfo.io/ip").Content.Trim()

# Set email subject and body
$subject = "Public IP Address"
$body = "The public IP address of the workstation is: $publicIP"

# Send the email
Send-MailMessage -From $senderEmail -To $recipientEmail -Subject $subject -Body $body -SmtpServer $smtpServer -Port $smtpPort -UseSsl -Credential (New-Object System.Management.Automation.PSCredential($smtpUsername, (ConvertTo-SecureString $smtpPassword -AsPlainText -Force)))
