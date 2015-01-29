# CtrlP QuickRef

This plug-in is an extension of CtrlP and provides quick access to any
references in your local environment.

## Usage

To run this plug-in, just type below and hit enter.

    :CtrlPQuickRef

Then you get ctrlp interface with paths which are manually registered by you.
You choose one of them and then get ctrlp interface again with files which are
searched in chosen path.

First paths are loaded from the variable g:ctrlp_quickref_paths or
~/.ctrlp-quickref file. The file is written like below.

    # Write
    # some
    # comments

    path/which/you/want/to/be/searched
    path2

    # additional comment
    path3

## Dependencies

[CtrlP](https://github.com/kien/ctrlp.vim) only

## Install

Clone this repository and put that directory in ~/.vim.
You can also use favorite package manager to install this.
