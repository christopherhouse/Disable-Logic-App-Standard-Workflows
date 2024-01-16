# How to Disable Logic Apps Standard Workflows

## Background
To disable individual workflows in a Logic Apps Standard resource, you can add an entry to your Logic App's App Settings in the form of
`Workflows.{your workflow name}.FlowState`, setting the value to either `Enabled` or `Disabled`.

## Script
The Set-Workflow-State.ps1 script allows you to pass in the name of a Logic App, a workflow name and a state, to enable or disable.

### Usage
`Set-Workflow-State -ResourceGroupName {your resource group} -LogicAppName {your logic app name} -WorkflowName {your workflow name} -State {$True|$False} ` 