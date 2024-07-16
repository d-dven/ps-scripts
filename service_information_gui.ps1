Add-Type -AssemblyName System.Windows.Forms
$FormObject=[System.Windows.Forms.Form]
$LabelObject=[System.Windows.Forms.Label]
$ComboBoxObject=[System.Windows.Forms.ComboBox]

$DefaultFont='Verdana,11'

$AppForm=New-Object $FormObject

$AppForm.ClientSize='500,200'
$AppForm.Text='Service Inspector'
$AppForm.BackColor='#faffaf'
$AppForm.Font=$DefaultFont

#Building the GUI
$lblService=New-Object $LabelObject
$lblService.Text='Services: '
$lblService.AutoSize=$true
$lblService.Location=New-Object System.Drawing.Point(20,20)

$ddlService=New-Object $ComboBoxObject
$ddlService.Width='300'
$ddlService.Location=New-Object System.Drawing.Point(140,20)

#Load the drop down list for services
Get-Service | ForEach-Object {$ddlService.Items.Add($_.Name)}

$ddlService.Text='Pick a Service'

$lblForName=New-Object $LabelObject
$lblForName.Text='Service Friendly Name: '
$lblForName.AutoSize=$true
$lblForName.Location=New-Object System.Drawing.Point(20,80)

$lblName=New-Object $LabelObject
$lblName.Text='test'
$lblName.AutoSize=$true
$lblName.Location=New-Object System.Drawing.Point(220,80)


$lblForStatus=New-Object $LabelObject
$lblForStatus.Text='Status: '
$lblForStatus.AutoSize=$true
$lblForStatus.Location=New-Object System.Drawing.Point(20,140)

$lblStatus=New-Object $LabelObject
$lblStatus.Text='test'
$lblStatus.AutoSize=$true
$lblStatus.Location=New-Object System.Drawing.Point(220, 140)


$AppForm.Controls.AddRange(@($lblService, $ddlService, $lblForName, $lblName, $lblStatus, $lblForStatus))

#Add some functions to form
function GetServiceDetails{
    $ServiceName=$ddlService.SelectedItem
    Write-Host "Service Name : $ServiceName"
 ## This line is for testing if the retrieval of ServiceName upon clicking the button

    $details=Get-Service -Name $ServiceName | select displayname,status
    $lblName.Text=$details.displayname
    $lblStatus.Text=$details.status

    #logic for color change
    if ($lblStatus.Text -eq 'Running') {
        $lblStatus.ForeColor='green'
    }else{
        $lblStatus.ForeColor='red'
    }
}

##Add functions to the controls
$ddlService.Add_SelectedIndexChanged({GetServiceDetails})

#Show Form
$AppForm.ShowDialog()

#Garbage Collection
$AppForm.Dispose()