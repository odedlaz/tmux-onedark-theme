# tmux-onedark-theme
A dark tmux color scheme for 16/256-color terminals, based on [onedark.vim](https://github.com/joshdick/onedark.vim), with is inspired by [One Dark syntax theme](https://github.com/atom/one-dark-syntax) for the [Atom text editor](https://atom.io).

![tmux-onedark-theme Preview](https://raw.githubusercontent.com/odedlaz/tmux-onedark-theme/master/preview-terminal.png)

### Set Options

**!** Set the following options in your `.tmux.conf`

You can control the widgets on `right-status` by setting `@onedark_widgets`:

```
set -g @onedark_widgets "#(date +%s)"
```

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

set -g @plugin 'odedlaz/tmux-onedark-theme'

Hit `prefix + I` to fetch the plugin and source it.

### Manual Installation

Clone the repo:

$ git clone https://github.com/odedlaz/tmux-onedark-theme /a/path/you/choose

Add this line to the bottom of `.tmux.conf`:

run-shell /a/path/you/choose tmux-onedark-theme.tmux

Reload TMUX environment (type this in terminal)

   $ tmux source-file ~/.tmux.conf

## Issues

### TrueColor

   The lastest tmux release, 2.3, doesn't support true color in the status line.  
   [Support has been added](https://github.com/tmux/tmux/issues/490), and will probably ship with the next release.  
   You can compile tmux and enjoy TrueColor right away!

### License

[MIT](LICENSE)
