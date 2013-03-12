# Personal Emacs Configuration

## Install

    ln -s $REPO ~/.emacs.d

The idea is to put your personal files into the .gitignore.

## Concept

The biggest challenge with Emacs configuration is to find a consistent way
to organize it. El-get offers a easy way to setup external packages and let
you organize all the specific customization of these packages in the
`~/.emacs.d/packages.d/` directory within the corresponding `init-<package>.el`
file. For more information, consult [el-get](https://github.com/dimitri/el-get)
documentation.

Other non-custom-mode specific customization are organized as follow:

- `defaults.el` for classical general customization
- `visual.el` for everything related to frames and visual buffer interaction
- `key-bindings.el` for customized key-bindings except for external packages
- `mac.el` for Mac OS X specific customization

## What's in there?

The developing environment is optimized for Python, Javascript, HTML, CSS.

## Keybindings

* `C      ` Shorthand for the ctrl-key
* `M      ` Shorthand for the meta-key (bound to cmd on my mac settings)
* `S      ` Shorthand for the shift-key

### Files

* `C-x C-f` Open a file. Starts in the current directory. You can use `C-SPC` or `C-@` to save your current set of match and plug in more criteria.
* `C-x f  ` Open a recently visited file
* `C-x o  ` Open a file in the current project (based on .git ++)
* `C-x C-s` Save this file
* `C-x C-w` Save as ...
* `C-x C-j` Jump to this files current directory
* `C-x b  ` Switch to another open file (buffer)
* `C-x C-b` List all open files (buffers)

### Cut copy and paste

* `C-space` Start marking stuff. C-g to cancel.
* `C-w    ` Cut (aka kill)
* `C-k    ` Cut till end of line
* `M-w    ` Copy
* `C-y    ` Paste (aka yank)
* `M-y    ` Cycle last paste through previous kills
* `C-x C-y` Choose what to paste from previous kills

### General

* `C-g    ` Quit out of whatever mess you've gotten yourself into
* `M-x    ` Run a command by name
* `C-_    ` Undo
* `M-_    ` Redo
* `C-x u  ` Show the undo-tree
* `C-x g  ` Open magit. It's a magical git interface for emacs
* `C-x C-h` Open helm-mini

### Navigation

* `C-arrow` Move past words/paragraphs
* `C-a    ` Go to indentation, then start of line
* `C-e    ` Go to end of line
* `M-g M-g` Go to line number
* `C-x C-i` Go to symbol
* `C-s    ` Search forward. Press `C-s` again to go further.
* `C-r    ` Search backward. Press `C-r` again to go further.

### Window management

* `C-x 0  ` Close this window
* `C-x 1  ` Close other windows
* `C-x 2  ` Split window horizontally
* `C-x 3  ` Split window vertically
* `S-arrow` Jump to window to the left/right/up/down
* `M-arrow` Jump to window to the left/right/up/down

### Mode Line

Instead of a long list of Major and Minor modes that are active, I have greek
symbols representing those modes.

* λ    Clojure mode
* τ    undo-tree
* γ    yas
* υ    volatile highlights
* ηζ  nREPL minor mode
* α    auto-complete
* φ    paredit
* π    Python mode

# Inspirational dotemacs

This repository is an emacs settings heavily relying on the new Emacs 24
features and the [el-get](https://github.com/dimitri/el-get) alternative
package manager.

Other indirect contributors include:

* [Emacs Rocks](http://emacsrocks.com) from @magnars
* [Emacs Prelude](http://batsov.com/prelude/) from @bbatsov
