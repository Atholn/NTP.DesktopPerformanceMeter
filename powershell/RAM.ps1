$totalRam = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).Sum
$availMem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
(104857600 * $availMem / $totalRam).ToString("#,0.000")