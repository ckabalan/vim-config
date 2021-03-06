# CKabalan's Vim Configuration

## Installation - Vim

The commands below clone the repository into ~/.vim and update all the plugins.

#### Linux
```bash
git clone --recursive https://github.com/ckabalan/vim-config.git ~/.vim
```
#### Windows
```batch
git clone --recursive https://github.com/ckabalan/vim-config.git %USERPROFILE%/vimfiles
```

#### Update Vim Modules
```bash
git submodule update --recursive --remote
```

## Installation - NeoVim

```bash
mkdir -p ~/.config/nvim && git clone --recursive https://github.com/ckabalan/vim-config.git ~/.config/nvim && ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
```
The command above clones the repository into ~/.config/nvim and creates a symlink from vimrc to init.vim.

#### Update Vim Modules
```bash
git submodule update --recursive --remote
```

#### Make NeoVim default

~/.bashrc

```bash
# Set Editors to NeoVim
export EDITOR='TERM=xterm-256color nvim'
export GIT_EDITOR='TERM=xterm-256color nvim'
export VISUAL='TERM=xterm-256color nvim'
# Force tmux to assume the terminal supports 256 colours.
alias tmux="tmux -2"
alias nvim="TERM=xterm-256color nvim"
```

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
 * [ansible-vim](https://vimawesome.com/plugin/ansible-vim) - A vim syntax plugin for Ansible 2.x
 * [dockerfile.vim](http://vimawesome.com/plugin/dockerfile-vim) - Vim syntax file & snippets for Docker's Dockerfile
 * [gruvbox](http://vimawesome.com/plugin/gruvbox) - Retro groove color scheme for Vim
 * [gundo.vim](https://github.com/sjl/gundo.vim) - Gundo.vim is Vim plugin to visualize your Vim undo tree.
 * [molokai](http://vimawesome.com/plugin/molokai) - Molokai color scheme for Vim
 * [nerdtree](http://vimawesome.com/plugin/nerdtree-red) - A tree explorer plugin for vim.
 * [vim-airline](http://vimawesome.com/plugin/vim-airline) - lean & mean status/tabline for vim that's light as air
 * [vim-airline-themes](http://vimawesome.com/plugin/vim-airline-themes) - A collection of themes for vim-airline
 * [vim-bufkill](http://vimawesome.com/plugin/bufkill-vim) - Close buffers without closing splits, windows, or tabs
 * [vim-easymotion](http://vimawesome.com/plugin/easymotion) - Vim motions on speed!
 * [vim-flake8](https://vimawesome.com/plugin/vim-flake8) - Run python files through static syntax and file checker
 * [vim-fugitive](http://vimawesome.com/plugin/fugitive-vim) - fugitive.vim: a Git wrapper so awesome, it should be illegal
 * [vim-jenkinsfile](https://vimawesome.com/plugin/vim-jenkinsfile) - Simple Vim plugin to recognise Jenkinsfile as a Groovy script
 * [vim-json](http://vimawesome.com/plugin/vim-json-speak-now) - Syntax highlighting for JSON in Vim
 * [vim-markdown](http://vimawesome.com/plugin/vim-markdown-enchanted) - Vim Markdown runtime files
 * [vim-nerdtree-tabs](http://vimawesome.com/plugin/vim-nerdtree-tabs) - NERDTree and tabs together in Vim, painlessly
 * [vim-ps1](https://vimawesome.com/plugin/vim-ps1) - A Vim plugin for Windows PowerShell support
 * [vim-puppet](http://vimawesome.com/plugin/vim-puppet-enchanted) - Puppet niceties for your Vim setup
 * [vim-startify](http://vimawesome.com/plugin/vim-startify) - The fancy start screen for Vim
 * [vim-tmux-navigator](https://vimawesome.com/plugin/vim-tmux-navigator) - Seamless navigation between tmux panes and vim splits
 * [vim-virtualenv](https://vimawesome.com/plugin/virtualenv-vim) - Vim plugin for working with python virtualenvs

## Non-Default Addons

These are other addons I find useful but don't need to be installed everywhere:

* https://github.com/vim-syntastic/syntastic
* https://github.com/Valloric/YouCompleteMe

## Tmux Tweaks

~/.tmux.conf

```bash
# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
        bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
        bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
        bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
        bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
        bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
#set-option -g default-terminal "screen-256color"
```

## Puppet File Format Fixes

After install remove the following lines from `./bundle/vim-puppet/ftplugin/puppet.vim`:

```vim
setl ts=2
setl sts=2
setl sw=2
setl et
```

## Building Vim

The following commands won't always be necessary but they can be used to build the latest version of Vim from source.

```bash
yum groupinstall "Development tools"
yum install -y lua lua-devel luajit luajit-devel ctags python python-devel perl perl-devel perl-ExtUtils-Embed ncurses-devel
git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge --enable-pythoninterp --enable-perlinterp -enable-luainterp --with-luajit --enable-fail-if-missing
make
make install
```

**Note**: For Python3 support change `--enable-pythoninterp` to `--enable-python3interp`. If it can't find python3 even though it exists append `vi_cv_path_python3=/path/to/python3.X` to the end of the `./configure` line.

## Building NeoVim ([source](https://github.com/neovim/neovim/wiki/Building-Neovim))

```bash
yum groupinstall "Development tools"
yum -y install libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
make install
```

## License

CKabalan's Vim Configuration is released under the [MIT License](https://opensource.org/licenses/MIT)
