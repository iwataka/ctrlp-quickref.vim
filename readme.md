# ctrlp-quickref.vim

This plug-in is an extension of CtrlP and provides quick access to any
references in your local environment. Install this plug-in and register some
paths in specified variable or file, then you can open any files on the fly.

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
    path1
    path2

    # wildcard can be used
    another/path/*

## Requirement

+ [ctrlp.vim](https://github.com/kien/ctrlp.vim)

## Installation

Clone this repository and put that directory in ~/.vim.
You can also use your favorite package manager to install this.
