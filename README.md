# Neovim-Configuration

My own Neovim editor configuration repo.


## Main Configuration

All plugins are from the ```packer.nvim``` package manager. My configurations until now are:
* **Markdown files preview command**: with ```:Markdown*``` commands.
* **Used Colorscheme**: github-dark colorscheme. for more details, you can see ```lua/obadaa/colorscheme```.
* **Vim configurations and keymaps**: configurations are in ```lua/obadaa/config.lua``` and keymaps are in ```lua/obadaa/keymaps.lua```.
* **Auto completion**: with many customizable options in ```lua/obadaa/cmp.lua```.
* **Languages server protocol (LSP)**: with c,c++,php,html,json and powershell services with its cmp.
You can add more languages by searching for your language key in [LSP servers](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers),
Or check ```:Lsp*``` commands, then put this key in ```lua/obadaa/lsp/lsp-config.lua:servers```, and it will be automatically installed. 
* **Settings for specific languages**: you can customize your LSP setting files for each language .. for more details you can watch [this video](youtube.com/watch?v=6F3ONwrCxMg)

## Requirments

Make sure that [Neovim](https://neovim.io/) and [git](https://git-scm.com/) are installed. For icons used in the repo, you need to install one of the [NerdFonts](https://github.com/ryanoasis/nerd-fonts)

## Installation 

To get started, just clone the repo and feel free to try my configuration. 

### Windows

```
cd ~/AppData/Local/nvim
git clone https://github.com/MuhammdObadaa/Neovim-config.git
```

## Details and Resources

you can view all packages and plugins repos from ```lua/obadaa/plugins.lua```

