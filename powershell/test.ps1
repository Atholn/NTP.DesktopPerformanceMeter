 new-item -path C:\flutter\proj\powershell -name "$(get-date -format 'yyyyMMdd_HHmm').txt" `
        -value ("Process $($P.Name) GPU Process Memory $([math]::Round($_/1MB,2)) MB`n"+
         "Process $($P.Name) GPU Engine Usage $([math]::Round($_,2))%`n" +
          "Total GPU Engine Usage: $([math]::Round($GpuUseTotal,2))%`n"+
        "Total GPU Process Memory Local Usage: $([math]::Round($GpuMemTotal/1MB,2)) MB`n").toString() -itemtype file


        $GpuUseTotal = (((Get-Counter "\GPU Engine(*engtype_3D)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
    Write-Output "Total GPU Engine Usage: $([math]::Round($GpuUseTotal,2))%"


     "Total GPU Engine Usage: $([math]::Round($GpuUseTotal,2))%`n"+
        "Total GPU Process Memory Local Usage: $([math]::Round($GpuMemTotal/1MB,2)) MB`n";


        $sum = [int]$args[0] + [int]$args[1]  
$p = Get-Process dwm
((Get-Counter "\GPU Process Memory(pid_$($p.id)*)\Local Usage").CounterSamples | where CookedValue).CookedValue | 
    foreach {Write-Output "Process $($P.Name) GPU Process Memory $([math]::Round($_/1MB,2)) MB"}
((Get-Counter "\GPU Engine(pid_$($p.id)*engtype_3D)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue |
    foreach {Write-Output "Process $($P.Name) GPU Engine Usage $([math]::Round($_,2))%"}


    # Example to get total GPU usage counters:
$GpuMemTotal = (((Get-Counter "\GPU Process Memory(*)\Local Usage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
    Write-Output "Total GPU Process Memory Local Usage: $([math]::Round($GpuMemTotal/1MB,2)) MB"
      $GpuUseTotal = (((Get-Counter "\GPU Engine(*engtype_3D)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
    Write-Output "Total GPU Engine Usage: $([math]::Round($GpuUseTotal,2))%"


      
        $GpuUseTotal = (((Get-Counter "\GPU Engine(*engtype_3D)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
    Write-Output "Total GPU Engine Usage: $([math]::Round($GpuUseTotal,2))%"

        Get-Counter -Counter  "\Procesor(*)\Czas procesora (%)" -Continuous