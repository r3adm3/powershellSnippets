function enable-fwrule {
[CmdletBinding()]
  param(
	[string]$rulename
  )
  write-host "Enabling rule $ruleName"
  enable-netfirewallrule -name $ruleName
}

# rules to test
$rules = "RemoteDesktop-UserMode-In-TCP", "RemoteDesktop-UserMode-In-UDP", "RemoteDesktop-Shadow-In-TCP"

# test each rule
foreach ($rule in $rules) {

  $fwCheck = get-netfirewallrule -name $rule

  if ($fwCheck.Enabled -eq "False"){
    enable-fwrule -rulename $rule		
  }

}
