
@echo off
cd code\BlockchainApp\BlockchainAPI.Tests
dotnet build
dotnet test --logger trx
cd ..
call testcoverage.cmd

exit %ERRORLEVEL%