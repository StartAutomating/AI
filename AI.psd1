@{
    ModuleVersion = '0.1'
    RootModule = 'AI.psm1'
    FormatsToProcess = 'AI.format.ps1xml'
    TypesToProcess = 'AI.types.ps1xml'    
    Guid = '04dd4665-4116-4450-8600-eec97e396f8d'
    Description = 'Automate AI with PowerShell'
    Author = 'James Brundage'
    CompanyName = 'Start-Automating'
    Copyright = '2025 Start-Automating'
    PrivateData = @{
        PSData = @{
            Tags = @('AI','Ollama', 'PowerShell', 'LLM')
            ProjectURI = 'https://github.com/StartAutomating/AI'
            LicenseURI = 'https://github.com/StartAutomating/AI/blob/main/LICENSE'
            ReleaseNotes = @'
> Like It? [Star It](https://github.com/StartAutomating/AI)
> Love It? [Support It](https://github.com/sponsors/StartAutomating)

## AI 0.1

* Initial release of AI module (#1)
  * Ollama support
    * Get-Ollama wraps the Ollama API and CLI (#2)
    * Remove-Ollama removes a model (#3)
* Get-AI allows for open-ended prompting (#4)
'@
        }
    }
}