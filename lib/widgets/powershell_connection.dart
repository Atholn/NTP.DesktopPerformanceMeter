import 'dart:io';

String runPowerShellScript(String scriptPath) {
  return Process.runSync(
          'Powershell.exe', ['-File', scriptPath,]).stdout
      as String;
}


String runPowerShellScript2(String scriptPath, List<String> argumentsToScript) {
  return Process.runSync(
          'Powershell.exe', ['-File', scriptPath, ...argumentsToScript]).stdout
      as String;
}