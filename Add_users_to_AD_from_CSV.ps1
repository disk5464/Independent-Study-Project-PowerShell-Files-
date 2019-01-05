#This script imports a csv along with it's headers and then uses the data to cerate a user for each entry
####################################################################################

$AD_Csv = Import-Csv -Path 'D:\Important Files\College\Blum Project\AD_Users.csv' -Header first, last, first_and_last, email, display_name, user_name

foreach ($name in $AD_Csv)
{
    New-ADUser -Name $name.first_and_last -Credential $name.user_name -DisplayName $name.display_name -EmailAddress $name.email -Enabled $True -PasswordNotRequired $true
}