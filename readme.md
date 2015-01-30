# ctrlp-quickref.vim

## Motivation

When you write programs, you may want to view source codes of libraries,
applications or something like that which you use. If you use this plug-in, you
can view them without any effort!

## Introduction

This plug-in is an extension of CtrlP and provides quick access to any
references in your local environment. Install this plug-in and register some
paths in specified variable or file, then you can open any files on the fly.

This plug-in also detect extensions of files and when opening files with
specified extensions like html or pdf, they are opened by "open-command"
which is "open" in Mac OS, "xdg-open" in Linux OS, "start" in Windows OS or
"cygstart" in Cygwin environment.

## Usage

After installing this plug-in, you should register some paths you want to
search in g:ctrlp_quickref_paths variable or ~/.ctrlp-quickref file. If you
want to register paths in the variable, you should write them like below in
your vimrc.

    let g:ctrlp_quickref_paths = [
        \ '/directory1/library_or_something_else/src',
        \ '/directory2/*/src',
        \ '/directory3/*',
        " You want to exclude specified directory, put '!' at the head.
        \ '! /directory3/library_or_something_else/'
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

    # You can also exclude specified directory by writing like this
    ! /directory3/library_or_something_else

That's all you should do. As you can see, you can write paths like doing in
gitignore or something like that.

Then you run the command :CtrlPQuickRef and get CtrlP interface with paths
which are registered by you. After you choose one of them by typing some
characters and hit Enter, you get CtrlP interface again with files in selected
path. If you selected one or more of these files, they are opened in Vim. They
are opened with readonly flag by default.  Doing like this, you can open any
files on the fly.

## Commands

+ :CtrlPQuickRef

    Open CtrlP interface with specified paths.

+ :CtrlPQuickRefLastDir

    Open CtrlP interface in last selected directory.

+ :CtrlPReference

    Almost same as CtrlP command, but open files with readonly flag by default.
    This command is used after :CtrlPQuickRef command.

## Options

+ ctrlp_reference_readonly_enabled

    Set this to 0 to open files without readonly flag (default: 1).

+ ctrlp_reference_open_extensions

    If you open files which have extensions contained in this list, they are
    opened by "open-command" (default: ['html', 'pdf']).

+ ctrlp_quickref_configuration_file

    If you want to write paths in other file, set this to the path (default:
    '~/.ctrlp-quickref').

+ ctrlp_quickref_paths

    This list contains paths which are the candidates of this plug-in (default:
    []).

## Requirement

+ [ctrlp.vim](https://github.com/kien/ctrlp.vim)

## Installation

Clone this repository and put that directory in ~/.vim.
You can also use your favorite package manager to install this.
