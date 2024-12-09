
param([string]$argGroup)

function getGroupInfo{
    param (
        [string]$GroupID
    )

    $groupname = (get-mggroup -GroupID $groupID).DisplayName
    $groupownerIds = get-mggroupowner -GroupId $groupID
    write-output "GroupID   : $groupID"
    write-output "GroupName : $groupname"
    write-output "Owners    : "
    $groupownerIds | foreach-object {
        [PSCustomObject]@{
            UserID = $_.Id
            UserPrincipalName = (get-mguser -UserID $_.Id).UserPrincipalName
        }
    }

}

$groupID = $argGroup #"8d04c529-76b1-4fb6-9fc0-8e3f28e1ae88"
write-output ""
getGroupInfo $groupID
write-output ""