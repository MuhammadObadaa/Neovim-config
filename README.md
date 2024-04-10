# Neovim-Configuration

My own Neovim editor configuration repo.


## Main Configuration

All plugins are from the ```packer.nvim``` package manager. My configurations until now are:
* **Markdown files preview**: with ```:Markdown*``` commands. It requires node.js to be installed.
* **Used Colorscheme**: github-dark colorscheme. for more details, you can see ```lua/obadaa/colorscheme.lua```.
* **Vim configurations and keymaps**: configurations are in ```lua/obadaa/config.lua``` and keymaps are in ```lua/obadaa/keymaps.lua```.
* **Auto completion**: with many customizable options in ```lua/obadaa/cmp.lua```.
* **Languages server protocol (LSP)**: with c,c++,php,html,json and powershell services with its cmp.
You can add more languages by searching for your language key in [LSP servers](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers),
Or check ```:Lsp*``` commands, then put this key in ```lua/obadaa/lsp/lsp-config.lua:servers```, and it will be automatically installed. 
* **Settings for specific languages**: you can customize your LSP setting files for each language .. for more details you can watch [this video](youtube.com/watch?v=6F3ONwrCxMg)
* **Telescope**: for searching about files, texts, planets (as an easter egg), etc.. In a windows system there are some  dependencies, listed in Requirments. for more telescope configurations,
you can check ```lua/obadaa/telescope.lua``` file. 
* **Nvim-tree**: for more comfortable view of the directories structure. There are some errors with its config file ```lua/obadaa/nvim-tree.lua```, probably they are because of the operating system
where the configuration is being set. 
NOTE: (:Telescope plantes) command doesn't work correctly in windows system.

## Requirments

Make sure that [Neovim](https://neovim.io/) and [git](https://git-scm.com/) are installed. For icons used in the repo, you need to install one of the [NerdFonts](https://github.com/ryanoasis/nerd-fonts)

As there are no rg 'grep' and fd 'find' commands in windows system, you neet to install them:
```
winget install sharkdp.fd
winget install BurntSushi.ripgrep.MSVC
```

## Installation 

To get started, just clone the repo and feel free to try my configuration. 

### Windows

```
cd ~/AppData/Local/nvim
git clone https://github.com/MuhammdObadaa/Neovim-config.git
```

## Details and Resources

you can view all packages and plugins repos from ```lua/obadaa/plugins.lua```

