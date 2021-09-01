[CmdletBinding()]
param()

# Arrange.
. $PSScriptRoot\..\..\..\Tests\lib\Initialize-Test.ps1
. $PSScriptRoot\..\Select-VSVersion.ps1
Register-Mock Write-Warning
Register-Mock Get-VSPath { "Some resolved location" } -- -Version '15.0'

# Act.
$actual = Select-VSVersion -PreferredVersion '14.0'

# Assert.
Assert-WasCalled Write-Warning
Assert-WasCalled Get-VSPath -Times 4
Assert-AreEqual -Expected '15.0' -Actual $actual
