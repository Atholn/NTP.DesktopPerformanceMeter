import 'dart:io';

String runPowerShellScript(String scriptPath) {
  return Process.runSync(
          'Powershell.exe', ['-File', scriptPath,]).stdout
      as String;
}

