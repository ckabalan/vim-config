# SpectralCoding's Vim Configuration

## Installation - Vim

The commands below clone the repository into ~/.vim and update all the plugins.

#### Linux
```bash
git clone --recursive https://github.com/SpectralCoding/vim-config.git ~/.vim
```
#### Windows
```batch
git clone --recursive https://github.com/SpectralCoding/vim-config.git %USERPROFILE%/vimfiles
```

#### Update Vim Modules
```bash
git submodule update --recursive --remote
```

## Installation - NeoVim

```bash
mkdir -p ~/.config/nvim && git clone --recursive https://github.com/SpectralCoding/vim-config.git ~/.config/nvim && git -C ~/.config/nvim submodule update --recursive --remote && ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
```

The command above clones the repository into ~/.config/nvim, updates all the plugins, and creates a symlink from vimrc to init.vim.

## Major Enhancements

 * Mouse Support
 * Tab indents make sense
 * NERDTree makes sense (hidden files, all tabs)
 * Molokai color scheme
 * Startup screen makes sense and has vim logo
 * Syntax highlighting enabled

## Cheat Sheet

### EasyMotion

 * `,<hjkl>` - Highlight Next Directional **Motion**
 * `,/` - Highlight Next **Search**
 
### Code Folding

 * `za` - Toggle Fold
 * `zc` - **C**lose Fold
 * `zo` - **O**pen Fold
 * `zr` - **R**educe Folding By 1 Level (Entire Buffer)
 * `zR` - **R**emove all folds
 * `zm` - **M**ore Folding By 1 Level (Entire Buffer)
 * `zM` - **M**aximum Folding

### Buffers (no Tabs!)

 * `<C-t>h` - Previous Buffer
 * `<C-t>j` - Previous Buffer
 * `<C-t>k` - Next Buffer
 * `<C-t>l` - Next Buffer
 * `:BUN` - **B**uffer **UN**load
 * `:BD` - **B**uffer **D**elete (Confirms if unwritten changes, `:BD!` or `:BW` to skip)
 * `:BW` - **B**uffer **W**ipeout (Discard without prompt)
 * `:ls` - **L**i**S**t buffers.
 * `:b<#>` - Switch to **B**uffer **#**.

### Git

 * `:Git <COMMAND>` - Any git command (Example - `:Git commit -am "Initial Commit!"`)
 * `:G<VERB>` - Any git command (Example - `:Gcommit -am "Initial Commit!"`)

## Plugin List (Pathogen)

 * [ack.vim](http://vimawesome.com/plugin/ack-vim) - Vim plugin for the Perl module / CLI script 'ack'
 * [dockerfile.vim](http://vimawesome.com/plugin/dockerfile-vim) - Vim syntax file & snippets for Docker's Dockerfile
 * [easymotion](http://vimawesome.com/plugin/easymotion) - Vim motions on speed!
 * [gruvbox](http://vimawesome.com/plugin/gruvbox) - Retro groove color scheme for Vim
 * [molokai](http://vimawesome.com/plugin/molokai) - Molokai color scheme for Vim
 * [The NERD tree](http://vimawesome.com/plugin/nerdtree-red) - A tree explorer plugin for vim.
 * [vim-airline](http://vimawesome.com/plugin/vim-airline) - lean & mean status/tabline for vim that's light as air
 * [vim-airline-themes](http://vimawesome.com/plugin/vim-airline-themes) - A collection of themes for vim-airline
 * [vim-bufkill](http://vimawesome.com/plugin/bufkill-vim) - Close buffers without closing splits, windows, or tabs
 * [vim-fugitive](http://vimawesome.com/plugin/fugitive-vim) - fugitive.vim: a Git wrapper so awesome, it should be illegal
 * [vim-json](http://vimawesome.com/plugin/vim-json-speak-now) - Syntax highlighting for JSON in Vim
 * [vim-markdown](http://vimawesome.com/plugin/vim-markdown-enchanted) - Vim Markdown runtime files
 * [vim-nerdtree-tabs](http://vimawesome.com/plugin/vim-nerdtree-tabs) - NERDTree and tabs together in Vim, painlessly
 * [vim-puppet](http://vimawesome.com/plugin/vim-puppet-enchanted) - Puppet niceties for your Vim setup
 * [vim-startify](http://vimawesome.com/plugin/vim-startify) - The fancy start screen for Vim.

## Building Vim

The following commands won't always be necessary but they can be used to build the latest version of Vim from source.

```bash
yum install -y lua lua-devel luajit luajit-devel ctags python python-devel perl perl-devel perl-ExtUtils-Embed ncurses-devel
git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge --enable-pythoninterp --enable-python3interp --enable-perlinterp -enable-luainterp --with-luajit --enable-fail-if-missing
make
make install
```

## License

SpectralCoding's Vim Configuration is released under the [MIT License](https://opensource.org/licenses/MIT)
