Add-Type -AssemblyName System.Windows.Forms
$FormObject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]
$ButtonObject = [System.Windows.Forms.Button]

$HelloWorldForm=New-Object $FormObject
$HelloWorldForm.ClientSize='500,300'
$HelloWorldForm.Text='Hello World'
$HelloWorldForm.BackColor='#acedcf'

$lbltitle=New-Object $LabelObject
$lbltitle.Text='Hello World'
$lbltitle.AutoSize=$true
$lbltitle.ForeColor='#faedac'
$lbltitle.Location=New-Object System.Drawing.Point(100,100)
$lbltitle.Font='Georgia,30,style=Bold'

$btnHello=New-Object $ButtonObject
$btnHello.Text='Say Hello!'
$btnHello.AutoSize=$true
$btnHello.Font='Verdana,15'
$btnHello.Location=New-Object System.Drawing.Point(200,225)

$HelloWorldForm.Controls.AddRange(@($lbltitle, $btnHello))

#Logic Section/Functions

function SayHello{
    if ($lbltitle.Text -eq '') {
    $lbltitle.Text='Hello World!'
    }else{
        $lbltitle.Text='Haha hi'
    }
}
##Add the functions to the form
$btnHello.Add_Click({SayHello})

#Display the form
$HelloWorldForm.ShowDialog()

#Cleans up the form
$HelloWorldForm.Dispose()