
$here = "$(Get-Location)"
$modPath = "$($here)\mods"
$mmc = (Get-Content $here.Replace(".minecraft", "mmc-pack.json") | ConvertFrom-Json).components

foreach ($name in $mmc) {
  if ($name.cachedName -eq "Quilt Loader") {
    Write-Host "Detected Quilt Mod Loader"
    $modloader = "quilt"
  }
  elseif ($name.cachedName -eq "Fabric Loader") {
    Write-Host "Detected Fabric Mod Loader"
    $modloader = "fabric"
  }
  elseif ($name.cashedName -eq "Forge") {
    Write-Host "Detected Forge Mod Loader"
    $modloader = "forge"
  }
}
$jenkins = "https://ci.wynntils.com/job/Artemis/lastSuccessfulBuild/artifact/$modloader/build/libs/"
$modname = "wynntils*-$modloader.jar"
$exists = Test-Path -Path "$modPath/$modname" -PathType Leaf
$connects = $true

try {
  Write-Host "Testing Connection to Jenkins"
  $request = Invoke-WebRequest $jenkins
}
catch {
  Write-Host "Could not connect to Jenkins - Update Aborted."
  $connects = $false
}
if ($connects) {
  $filename = ($request.ParsedHtml.getElementsByTagName("a") | Where-Object { $_.innerText -Like $modname } | Select-Object -ExpandProperty nameProp).Trim("about:")
  if ($exists) {
    $mod = Get-ChildItem -Path $modPath -Name -Filter $modname
    if (!($mod -eq $filename)) {
      Write-Host "Update Detected - Downloading"
      Remove-Item -Path "$modPath/$mod"
      Invoke-WebRequest "$jenkins/$filename" -OutFile "$modPath/$filename"
      Write-Host "Updated successfuly - Have Fun!"
    }
    else {
      Write-Host "You Are Using Newest Version Already! :)"
    }
  }
  elseif ($exists -eq $false) {
    Write-Host "Could Not Find Wynntils Artemis - Downlowind Newset Version"
    Invoke-WebRequest "$jenkins/$filename" -OutFile "$modPath/$filename"
    Write-Host "Downloaded successfully - Have Fun!"
  }
}
