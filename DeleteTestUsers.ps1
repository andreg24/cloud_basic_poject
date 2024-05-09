# PowerShell script to delete multiple Nextcloud users via Docker sequentially

$baseUserName = "locust_user"

# Number of users to delete
$totalUsers = 30

# ScriptBlock to delete a single user
$scriptBlock = {
    param($userName)
    
    # Command to delete the user in the Nextcloud instance
    $cmd = "docker exec --user www-data nextcloud_app1 php /var/www/html/occ user:delete $userName"
    Invoke-Expression $cmd

    # Output the user name to the console
    Write-Host "Deleted user: $userName"
}

# Delete the users
foreach ($i in 0..($totalUsers - 1)) {
    $userName = "$baseUserName$i"
    
    & $scriptBlock $userName
}