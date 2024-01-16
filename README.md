# How to Disable Logic Apps Standard Workflows

## Background
To disable individual workflows in a Logic Apps Standard resource, you can add an entry to your Logic App's App Settings in the form of
`Workflows.{your workflow name}.FlowState`, setting the value to either `Enabled` or `Disabled`.

## Script
The Set-Workflow-State.ps1 script allows you to pass in the name of a Logic App, a workflow name and a state, to enable or disable.

### Usage
`Set-Workflow-State -ResourceGroupName {your resource group} -LogicAppName {your logic app name} -WorkflowName {your workflow name} -IsEnabled {$True|$False} `

| Parameter | Description |
| --- | --- |
| ResourceGroupName | The name of the resource group containing the Logic App |
| LogicAppName | The name of the Logic App |
| WorkflowName | The name of the workflow to enable or disable |
| IsEnabled | Set to `$True` to enable the workflow, `$False` to disable |
