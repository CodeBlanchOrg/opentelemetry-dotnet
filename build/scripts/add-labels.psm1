function AddLabelsOnIssuesForPackageFoundInBody {
  param(
    [Parameter(Mandatory=$true)][int]$issueNumber,
    [Parameter(Mandatory=$true)][string]$issueBody
  )

  $match = [regex]::Match($issueBody, '^[#]+ Package\s*(OpenTelemetry(?:\.\w+)*)')
  if ($match.Success -eq $false)
  {
      Return
  }

  gh issue edit $issueNumber --add-label $("pkg:" + $match.Groups[1].Value)
}

Export-ModuleMember -Function AddLabelsOnIssuesForPackageFoundInBody

function AddLabelsOnPullRequestsBasedOnFilesChanged {
  param(
    [Parameter(Mandatory=$true)][int]$pullRequestNumber,
    [Parameter(Mandatory=$true)][string]$labelPackagePrefix # 'pkg:' on main repo, 'comp:' on contrib repo
  )

  throw 'this should not be checked out or run from fork'
}

Export-ModuleMember -Function AddLabelsOnPullRequestsBasedOnFilesChanged
