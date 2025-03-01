# AI

Automate AI with PowerShell.

## The AI Module

AI is a PowerShell module that lets you automate AI.

We are trying to make a good, open-ended toolkit for working with all sorts of AI.

We are starting somewhat simple, by automating [Ollama](https://ollama.com).

Want to help?  Consider [contributing](CONTRIBUTING.md)

### Installing

You can install the AI module from the PowerShell gallery:

~~~PowerShell
Install-Module AI -Scope CurrentUser
~~~

### Importing

You can import the AI module, with `Import-Module`

~~~PowerShell
Import-Module AI
~~~

### Basic Use

`Get-AI` (aliased to `ai`) is the core command of the AI module.

It gets a response from an AI.

~~~PowerShell
ai Write me a paragraph about PowerShell functions
~~~