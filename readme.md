# ctrlp-quickref.vim

This plug-in is an extension of CtrlP and provides quick access to any
references in your local environment. Install this plug-in and register some
paths in specified variable or file, then you can open any files on the fly.

## Usage

After installing this plug-in, you should register some paths you want to
search in g:ctrlp_quickref_paths variable or ~/.ctrlp-quickref file. If you
want to register paths in the variable, you should write them like below in
your vimrc.

    let g:ctrlp_quickref_paths = [
        \ '/directory1/library_or_something_else/src',
        \ '/directory2/*/src',
        \ '/directory3/*'
    ]

Wildcards are automatically expanded.
If you want to write paths in other file, you should make ~/.ctrlp-quickref
file and write them like below in it.

    # Write
    # Some
    # Comments
    /directory1/library_or_something_else/src
    /directory2/*/src

    # Additional comment
    /directory3/*

That's all you should do.  Then you run the command :CtrlPQuickRef and get
CtrlP interface with paths which are registered by you. After you choose one
of them by typing some characters and hit Enter, you get CtrlP interface again
with files in selected path. If you selected one or more of these files, they
are opened in Vim. They are opened with readonly flag by default.  Doing like
this, you can open any files on the fly.

## Requirement

+ [ctrlp.vim](https://github.com/kien/ctrlp.vim)

## Installation

Clone this repository and put that directory in ~/.vim.
You can also use your favorite package manager to install this.
