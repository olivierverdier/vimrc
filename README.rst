Textmate to Vim switching kit
============================

This vim configuration kit is:

**Mac OS X friendly**

I recently converted to vim from Textmate and other Mac OS X editors.
I tried to configure vim as conveniently as it could be for a Mac user.

**Well documented**

The configuration file ``vimrc.vim`` is well documented, should you need to change the settings.
Hopefully you will not have to dive in the docs to understand those settings.

Features
--------

General Key Bindings
''''''''''''''''''''

:⌘⇧I: Toggle invisible characters
:⌘⇧N: Toggle line numbers
:⌘⇧R: Toggle relative line numbers
:⌘⇧A: Search with Ack in current working directory
:⌘/: Toggle commenting on current/selected lines

:-: Previous jump position
:=: Next jump position
:⌘[: Previous edit position
:⌘]: Next edit position
:⌘': Previous spelling error

:⌃U: Activate gundo_

:⌘\\: Toggle file explorer split window
:⌘|: Toggle tag list

://: Search current selection
:_: Switch between split windows
:⇥: Switch between delimiters (same as ``%``)
:⌃P: Show current syntax scope

``⌁`` denotes the leader key, which is the backslash ``\`` in this configuration.
You may change it to some other key with ``let mapleader = "<your key here>"``.

:⌁v: Edit vim configuration file
:⌁␣: Switch search highlight off

Some the of the key bindings above have also a leader key equivalent (when working outside MacVim).

LaTeX Specific
''''''''''''''

:⌘⏎: Save, compile, and show preview of current document (you need `pydflatex`_ for this)
:⌘|: Table of Contents
:⌃E: Change current environment
:⌃W: Wrap selection with command
:⌘⇧B: Run ``bibtex`` on current document

.. _pydflatex: https://github.com/olivierverdier/pydflatex

RestructuredText Specific
'''''''''''''''''''''''''

:⌘⏎: Save, compile, and show preview of current document

Main Bundles
------------

A couple of vim bundles, included in this kit, which are must-haves for any self-respected vim user.

:ack: Search in a directory with ``ack``.
:latex-box: Simple LaTeX plugin
:nerdcommenter: Comment several line(s) at once
:nerdtree: Project navigation
:snipmate: Expand snippets with tab
:supertab: Arbitrary word completion with tab
:surround: Surround selection with delimiters
:taglist: Navigate a file with tags



Install
-------

This vim configuration should work with any vim editor, but if you are on Mac OS X, I strongly suggest that you install (the last snapshot of) MacVim::

    brew install macvim

Put the current ``~/.vim`` directory aside (if any).
Clone this repository into that ``.vim`` directory::

    git clone https://github.com/olivierverdier/vimrc.git ~/.vim

Put aside the current ``~/.vimrc`` file.
Create a symbolic link to the configuration file::

    ln -s ~/.vim/vimrc.vim ~/.vimrc

Install all the bundles::

    python ~/.vim/install_bundles.py

.. _gundo: https://github.com/sjl/gundo.vim
