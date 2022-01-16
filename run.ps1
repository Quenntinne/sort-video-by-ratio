$folder      = "E:\to_sort*"
$ffprobe     = "D:\ffmpeg-2022-01-13-git-c936c319bd-full_build\bin\ffprobe.exe"
$filetypes   = "*.mp4"

Clear-Host
Get-ChildItem $folder -include $filetypes -recurse | foreach {
    $details = & $ffprobe -loglevel quiet -show_streams -print_format flat=h=0 $_.Fullname
    $fileratio = $details | Select-String '(?<=stream.0.display_aspect_ratio=")\d+:\d+' |
       Foreach {$_.Matches} | ForEach-Object {$_.Value}
    $filewidth  = $details | Select-String '(?<=stream.0.width=)\d+' |
       Foreach {$_.Matches} | ForEach-Object {$_.Value}
    $fileheight  = $details | Select-String '(?<=stream.0.height=)\d+' |
       Foreach {$_.Matches} | ForEach-Object {$_.Value}

       $fileratiofolder = $fileratio
       Write-Host $filewidth
       Write-Host $fileheight

       # Need to find a better way to get the file height / width
       # Sometimes return blank value even if windows show the value in the columns
       try {
            $calculatedratio = $filewidth / $fileheight
       } catch {
            $calculatedratio = 0
       }
       Write-Host $calculatedratio


       # put the file who don't have ratio calculated on a specific folder
       if ($calculatedratio -eq 0) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0
       }

       if ($calculatedratio -gt 0 -and $calculatedratio -lt 0.1) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.01
       }

       if ($calculatedratio -ge 0.1 -and $calculatedratio -lt 0.2) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.1
       }

       if ($calculatedratio -ge 0.2 -and $calculatedratio -lt 0.3) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.2
       }

       if ($calculatedratio -ge 0.3 -and $calculatedratio -lt 0.4) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.3
       }

       if ($calculatedratio -ge 0.4 -and $calculatedratio -lt 0.5) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.4
       }

       if ($calculatedratio -ge 0.5 -and $calculatedratio -lt 0.6) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.5
       }

       if ($calculatedratio -ge 0.6 -and $calculatedratio -lt 0.7) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.6
       }

       if ($calculatedratio -ge 0.7 -and $calculatedratio -lt 0.8) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.7
       }

       if ($calculatedratio -ge 0.8 -and $calculatedratio -lt 0.9) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.8
       }

       if ($calculatedratio -ge 0.9 -and $calculatedratio -lt 1) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\0.9
       }

       if ($calculatedratio -ge 1 -and $calculatedratio -lt 1.1) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\1
       }

       if ($calculatedratio -ge 1.1 -and $calculatedratio -lt 1.2) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\1.1
       }

       if ($calculatedratio -ge 1.2 -and $calculatedratio -lt 1.3) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\1.2
       }

       if ($calculatedratio -ge 1.3 -and $calculatedratio -lt 1.4) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\1.3
       }

       if ($calculatedratio -ge 1.4 -and $calculatedratio -lt 1.5) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\1.4
       }

       if ($calculatedratio -ge 1.5 -and $calculatedratio -lt 1.6) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\1.5
       }

       if ($calculatedratio -ge 1.6 -and $calculatedratio -lt 1.7) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\1.6
       }

       if ($calculatedratio -ge 1.7 -and $calculatedratio -lt 1.8) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\1.7
       }

       if ($calculatedratio -ge 1.8) {
            Write-Host $fileratio `t`t $_.FullName
            Move-Item -Path $_.FullName -Destination E:\sorted\more
       }

}  
