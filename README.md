# vim-quickcmds

A simple Vim plugin which allows you to store 3 external commands which you can execute with a mapping of your choice.

The advantage of this plugin is that you can either execute the commands synchronous or assynchronous, depending
on what you set the 'g:async' variable to (either 0 or 1).


## Installation

Just move the quickcmds.vim file into your plugin directory. That's it.

## Configuration

```vim
g:quick_cmd1 -> Your first command.
g:quick_cmd2 -> Your second command.
g:quick_cmd3 -> Your third command.

g:quickcmds_key1 -> Your mapping for the first command.
g:quickcmds_key2 -> Your mapping for the second command.
g:quickcmds_key3 -> Your mapping for the third command.

g:async -> Either '0' or '1' whether you want synchronous or assynchronous execution.
