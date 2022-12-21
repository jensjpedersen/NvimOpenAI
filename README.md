
# opeanai_nvim 
This plugin integrates Open AI chat bots into Neovim. 
It makes it possible to send text from your current buffer and get answers from an AI
pasted into the buffer.  

![openai_nvim](https://user-images.githubusercontent.com/62065926/208917790-78e63840-20cd-4a7e-8b7c-053c2c83ad50.gif)


## Installation

Install with packer:

```lua
use 'jensjpedersen/openai_nvim'
```

## Setup


In order to send curl requests you need an API key. 
To get an API key for OpenAI, you can follow these steps:

Go to the OpenAI website (https://openai.com/) and click on the "Get API Key"
button in the top right corner of the page.

Create a new account or log in to your existing account.

Click on the "Create a new API key" button.

Follow the prompts to create a new API key and agree to the terms of service.

Once you have created your API key, it will be displayed on the API keys page
of your account. 


This plugin will read the API key from a shell variable named: `OPENAI_API_KEY'`. 
You can also use the setup variable in your nvim config. The default options
is: 

```lua
vim.g.openai_settings = {
    api_key = <YOUR-API-KEY>, 
    model = "text-davinci-003",
    temperature = 0.5, 
    max_tokens = 2048, 
    words_per_line = 15
}
```


There are two vim commands available with this plugin.
* `AISendLine` - Sends the content from the current line
* `AISendVisual`  - Sends the visual selected lines 

Example keybindings: 
```vim
nnoremap <Leader>a AISendLine<CR>
vnoremap <Leader>a AISendVisual<CR>
```

You can also call the lua functions directly: 
```vim
nnoremap <Leader>a :lua require("openai_nvim").send_current_line()<CR>
vnoremap <Leader>a :lua require("openai_nvim").send_visual_selection()<CR>
```


## Requirements
This plugin is only tested on a Linux system, but should work with all Unix
flavors, as long as `curl` and `timeout` is installed. 









