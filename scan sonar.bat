cd C:\Users\Andrya_A354\source\repos\DevOps for Database
dotnet-sonarscanner begin /k:"DevOpsforDatabase" /d:sonar.host.url="http://localhost:9000" /d:sonar.login="1e94ab9da0d018520c0286d9b6953a47bcf51434"
MsBuild.exe /t:Rebuild
dotnet-sonarscanner end /d:sonar.login="1e94ab9da0d018520c0286d9b6953a47bcf51434"
pause