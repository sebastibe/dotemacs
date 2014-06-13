Preamble
========

**An opinionated Emacs configuration based on [el-get], [Prelude], [Emacs Rocks]
and some personal flavor**

---

This configuration is *only* compatible with **GNU Emacs 24.x** (**24.3** recommended).

## Quick Install

Clone the repository and link it to the `.emacs.d` folder.

```bash
$ ln -s $REPO ~/.emacs.d
```

## Concept

The biggest challenge with Emacs configuration is code organization.
[Prelude] has made a big effort in the *horizontal* direction while
[el-get] offers an easy way to setup external packages which are usualy
more *vertical*. Preamble offers a opionated compromise integration between
both.
[el-get] organize all the specific customization of each packages in the
`~/.emacs.d/packages.d/` directory within the corresponding `init-<package>.el`
file.
[Preamble] mimic [Prelude] in organizing functionalities in modules.

Other non-custom-mode specific customization are organized as follow:

- `defaults.el` for classical general customization
- `visual.el` for everything related to frames and visual buffer interaction
- `key-bindings.el` for customized key-bindings except for external packages
- `mac.el` for Mac OS X specific customization

## What's in there?

The programming environment is optimized for Python, Javascript, CoffeScript, HTML, CSS.

## Keybindings

* `C      ` Shorthand for the ctrl-key
* `M      ` Shorthand for the meta-key (bound to cmd on my mac settings)
* `S      ` Shorthand for the shift-key

### Files

* `C-x C-f` Open a file. Starts in the current directory. You can use `C-SPC` or `C-@` to save your current set of match and plug in more criteria.
* `C-x f  ` Open a recently visited file
* `C-x p  ` Open a file in the current project (based on .git ++)
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
* `C-;`     Toggle iedit-mode to edit all the occurences of a region

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
* `C-c b  ` Create a scratch buffer to play inside 

### Terminal

* `C-c t ` Call a terminal session or join existing one
* `C-c n ` Jump to next terminal
* `C-c p ` Jump to previous terminal
* `F8    ` Open a terminal on the bottom of the buffer

### Project management

* `C-x C-h` helm-mini
* `C-c h  ` helm-mini projectile

### Mode Line

Instead of a long list of Major and Minor modes that are active, we use greek
and russian symbols representing those modes. Capital letters are used for
major modes.

* Λ    Clojure mode
* τ    undo-tree
* γ    yas
* υ    volatile highlights
* ηζ   nREPL minor mode
* α    auto-complete
* φ    paredit
* ιρις  rainbow mode
* Π    Python mode
* п    Projectile mode
* Мд   Markdown mode
* ел   emacs lisp mode
* р    ropemacs mode
* Коф  coffee-mode
* Лес  less-css mode

# Inspirational dotemacs

This repository is an emacs settings heavily relying on the new Emacs 24
features and the [el-get](https://github.com/dimitri/el-get) alternative
package manager.

Other indirect contributors include:

* [Emacs Rocks](http://emacsrocks.com) from @magnars
* [Prelude](http://batsov.com/prelude/) from @bbatsov
