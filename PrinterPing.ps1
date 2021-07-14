<#
Title: Printer Ping Utility
Created by: Matt Kukkonen
Version: 2.0
Version Date: 09/06/2017
This program Pings a printer to see if it is online and gives the option to Ping another printer or to remote into the printer's web app.
#### Version Notes ####
v0.1 - Started scrip in Batch format, was able to ping printer but to access web app had to type in IP address.
V1.0 - Batch scrip now pinged printer and then asked if you wanted to ping another printer, to go to the web app, or exit. No user input to go to web app besides picking the option.
V2.0 - Batch scrip now ported over to PowerShell format.
#>
cls
"Printer Ping Utility"
Write-Host "What Printer do you want to ping?: P" -NoNewline
$PrinterName = Read-Host 

Test-Connection -ComputerName "hostprefix-P$PrinterName" -Count 1
Do {
$title = "Printer Ping"
$message = "Ping another Printer, Access Web App, or Exit?"

$Ping = New-Object System.Management.Automation.Host.ChoiceDescription "&Ping", `
    "Ping printer."

$Web = New-Object System.Management.Automation.Host.ChoiceDescription "&Web", `
    "Access web app."

$Exit = New-Object System.Management.Automation.Host.ChoiceDescription "&Exit", `
    "Close program."

$options = [System.Management.Automation.Host.ChoiceDescription[]]($Ping, $Web, $Exit)

$result = $host.ui.PromptForChoice($title, $message, $options, 0) 

switch ($result)
    {
        0 {cls
        "Printer Ping Utility"
        Write-Host "What Printer do you want to ping?: P" -NoNewline
        $PrinterName = Read-Host 
        ""
        Test-Connection -ComputerName "GXUSBR-P$PrinterName" -Count 1}
        1 {Start-Process "https://hostname-P$PrinterName.domain.com"}
        2 {<#exit#>}
    }
    }
    while ($result -ne 2)
    Exit
