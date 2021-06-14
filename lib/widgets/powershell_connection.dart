import 'dart:io';

String runPowerShellScript(String scriptPath, List<String> argumentsToScript) {
  return Process.runSync(
          'Powershell.exe', ['-File', scriptPath, ...argumentsToScript]).stdout
      as String;
}

