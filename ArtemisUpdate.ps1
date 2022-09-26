$modPath = $args[0]
$modPath = "$modPath/mods"
$modloader = $args[1]
$jenkins = "https://ci.wynntils.com/job/Artemis/lastSuccessfulBuild/artifact/$modloader/build/libs/"
$modname = "wynntils*-$modloader.jar"
$exists = Test-Path -Path "$modPath/$modname" -PathType Leaf
$connects = $true

try {
  $request = Invoke-WebRequest $jenkins
}
catch {
  Write-Host "Could not connect to Jenkins. Can not continue."
  $connects = $false
}
if ($connects) {
  $filename = ($request.ParsedHtml.getElementsByTagName("a") | Where-Object { $_.innerText -Like $modname } | Select-Object -ExpandProperty nameProp).Trim("about:")
  if ($exists) {
    $mod = Get-ChildItem -Path $modPath -Name -Filter $modname
    if (!($mod -eq $filename)) {
      Remove-Item -Path "$modPath/$mod"
      Invoke-WebRequest "$jenkins/$filename" -OutFile "$modPath/$filename"
      Write-Host "Updated successfuly"
    }
  }
  elseif ($exists -eq $false) {
    Invoke-WebRequest "$jenkins/$filename" -OutFile "$modPath/$filename"
    Write-Host "Downloaded successfully"
  }
}
