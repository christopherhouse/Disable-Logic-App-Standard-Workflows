param(
    [string]
    $ResourceGroupName,
    [string]
    $LogicAppName,
    [string]
    $WorkflowName,
    [bool]
    $IsEnabled
)

$workflowKey = 'Workflows.' + $WorkflowName + '.FlowState'
$logicApp = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $LogicAppName
$config = $logicApp.SiteConfig.AppSettings
$newAppSettings=  @{}

foreach ($item in $config) {
    $newAppSettings[$item.Name] = $item.Value
}

$workflowState = if ($IsEnabled) { 'Enabled' } else { 'Disabled' }

$newAppSettings[$workflowKey] = $workflowState

Write-Host "Updating App Settings entry $workflowKey to $workflowState"

Set-AzWebApp -ResourceGroupName $ResourceGroupName -Name $LogicAppName -AppSettings $newAppSettings

Write-Host "Update complete, $workflowName is now set to $workflowState"