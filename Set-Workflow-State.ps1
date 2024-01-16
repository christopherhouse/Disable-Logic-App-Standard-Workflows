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

$newAppSettings['Workflows.' + $WorkflowName + '.FlowState'] = $workflowState

Set-AzWebApp -ResourceGroupName $ResourceGroupName -Name $LogicAppName -AppSettings $newAppSettings
