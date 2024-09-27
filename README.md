# This vim configuration is not up to date anymore, as I have now switched to the amazing [spacemacs editor](https://www.spacemacs.org/) instead.

This vim configuration kit is:

**Mac OS X friendly**

I recently converted to vim from Textmate and other Mac OS X editors.
I tried to configure vim as conveniently as it could be for a Mac user.

**Well documented**

The configuration file ``vimrc.vim`` is well documented, should you need to change the settings.
Hopefully you will not have to dive in the docs to understand those settings.

## Features


### General Key Bindings

``⌁`` denotes the leader key, which is the backslash ``\`` in this configuration.
You may change it to some other key with ``let mapleader = "<your key here>"``.

Key | Effect
----|-------
⌁I | Toggle invisible characters
⌁N | Toggle line numbers
⌁R | Toggle relative line numbers
⌘⇧A | Search with Ack in current working directory
⌘/ | Toggle commenting on current/selected lines
 | 
⌘[ | Previous jump position
⌘] | Next jump position
- | Previous edit position
= | Next edit position
⌘' | Previous spelling error
⇥ | Switch between delimiters (same as `%`)
 |
⌃U | Activate [gundo][gundo]
 |
⌘\\ | Toggle file explorer split window
^p | Start ControlP in buffer mode
⌘\| | Toggle tag list
 | 
// | Search current selection
! | Switch between split windows
_ | Switch with last buffer
 | 
⌁p | Show current syntax scope
 | 
⌁v | Edit vim configuration file
 | 
␣ | Start search
⌁␣ | Switch search highlight off

Some the of the key bindings above have also a leader key equivalent (when working outside MacVim).

### LaTeX Specific

Key | Effect 
----|-------
⌘⏎ | Save, compile, and show preview of current document with SCons
⌘| | Table of Contents
⌃E | Change current environment
⌃W | Wrap selection with command

### RestructuredText Specific

Key | Effect
----|-------
⌘⏎ | Save, compile, and show preview of current document

## Main Bundles

A couple of vim bundles, included in this kit, which are must-haves for any self-respected vim user.

Bundle | Short Description
-------|------------------
[ack][ack] | Search in a directory with `ack`.
[ctrlp][ctrlp] | Navigate file/buffers (replaces `:b`)
[gundo][gundo] | Essential to navigate the undo/redo tree
[latex-box][latexbox] | Simple LaTeX plugin
[nerdtree][nerdtree] | Project navigation
[snipmate][snipmate] | Expand snippets with tab
[supertab][supertab] | Arbitrary word completion with tab
[surround][surround] | Surround selection with delimiters
[tagbar][tagbar] | Navigate a file with tags
[tComment][tComment] | Comment several line(s) at once

[ack]: https://github.com/mileszs/ack.vim#readme
[ctrlp]: https://github.com/kien/ctrlp.vim#readme
[gundo]: https://github.com/sjl/gundo.vim#readme
[indent-object]: https://github.com/michaeljsmith/vim-indent-object#readme
[latexbox]: https://github.com/olivierverdier/vim-latex-box#readme
[tComment]: https://github.com/vim-scripts/tComment#readme
[nerdtree]: https://github.com/spf13/nerdtree#readme
[snipmate]: https://github.com/garbas/snipmate.vim#readme
[supertab]: https://github.com/ervandew/supertab#readme
[surround]: https://github.com/tpope/vim-surround#readme
[tagbar]: https://github.com/majutsushi/tagbar#readme

## Install

This vim configuration should work with any vim editor, but if you are on Mac OS X, I strongly suggest that you install (the last snapshot of) MacVim:

```sh
brew install macvim
```

Put the current ``~/.vim`` directory aside (if any).
Clone this repository into that ``.vim`` directory:

```sh
git clone https://github.com/olivierverdier/vimrc.git ~/.vim
```

Put aside the current ``~/.vimrc`` file.
Create a symbolic link to the configuration file:

```sh
ln -s ~/.vim/vimrc.vim ~/.vimrc
```

Install all the bundles:

```sh
python ~/.vim/install_bundles.py
```


