# PowerShell script to create multiple Nextcloud users

$baseUserName = "locust_user" # username for all the users
$password = "test_password1234!" # password for all the users

# Total number of users to create
$totalUsers = 30

# ScriptBlock for creating a single user
$scriptBlock = {
    param($userName, $password)
    
    # Command to create the user in the Nextcloud instance
    $cmd = "docker exec -e OC_PASS=$password --user www-data nextcloud_app1 /var/www/html/occ user:add --password-from-env $userName"
    Invoke-Expression $cmd

    # Output the user name to the console
    Write-Host "Created user: $userName"
}

# Create the users
foreach ($i in 0..($totalUsers - 1)) {
    # Build the user name for this iteration
    $userName = "$baseUserName$i"

    # Create user with the previously defined script block, by passing parameters
    & $scriptBlock $userName $password
}
