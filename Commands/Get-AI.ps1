function Get-AI {
    <#
    .SYNOPSIS
        Get AI in PowerShell
    .DESCRIPTION
        Gets responses from an AI in PowerShell.
        
        Go ahead, ask it anything.  Just check the response.
    .NOTES
        This function will change over time as new capabilities are added.

        Currently, it will do the following:

        * Run Ollama models
          * If the command is invoked with an alias, it will assume that the alias is a model name.
    .EXAMPLE
        # Ask ai anything you want.  Just try to keep it to a single sentence.
        ai Why is the sky blue?  Limit your response to a single sentence.
    .EXAMPLE
        # Each loaded ollama model will be aliased to `Get-AI`, so you can refer to them by name.
        phi3 Write me a limerick.
    #>
    [Alias('AI')]
    param()
    
    $allInput = @($input)
    $allArguments = @($args)

    $MyCommandAst = $(
        $MyCaller = $(
            $myCallStack=@(Get-PSCallstack)
            $myCallStack[-1]
        )
        if ($MyCaller) {
            $myInv = $MyInvocation
            $MyCaller.InvocationInfo.MyCommand.ScriptBlock.Ast.FindAll({
                param($ast) 
                    $ast.Extent.StartLineNumber -eq $myInv.ScriptLineNumber -and
                    $ast.Extent.StartColumnNumber -eq $myInv.OffsetInLine -and 
                    $ast -is [Management.Automation.Language.CommandAst]
            },$true)
        }
    )

    if ($MyCommandAst) {
        $null = New-Event -SourceIdentifier "ai://$($MyCommandAst)" -MessageData ([Ordered]@{})
    } else {

    }
    

    $chatMessages = @(
        foreach ($arg in $args) {
            if ($arg -is [string]) {
                $arg
            } else {
                $arg 
            }
        }
    )

    $modelName = 
        if ($myInv.InvocationName -ne $myInv.MyCommand.Name -and 
            $myInv.InvocationName -ne ($myInv.MyCommand.Name -replace '^Get-')
        )  {
            $myInv.InvocationName
        } elseif ($ai.DefaultModel) {
            $ai.DefaultModel
        } elseif ($script:LastOllamaModel) {
            $script:LastOllamaModel
        }
        else {                
            'llama3.2'
        }
    
    if ($chatMessages) {            
        ollama run $modelName @chatMessages
    }        
}