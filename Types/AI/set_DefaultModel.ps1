param([string]$DefaultModel)
$this | 
    Add-Member -Force -NoteProperty -Name '.DefaultModel' -Value "$DefaultModel"