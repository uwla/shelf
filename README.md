# SHELF (SHELL FRAMEWORK)

Shelf is a minimalistic shell framework to share configuration accross  diferent
shells (`bash`, `sh`, `zsh`, and possibly others) in a organized manner.

It splits related shell configurations in files:

- `profile`: primary script which loads other configurations.
- `functions`: user-defined functions and utilities.
- `login`: script to run after first login.
- `env`: environment variables.
- `aliases`: custom shell aliases.
- `plugins/`: directory with shell-specific plugins.
- `completion/`: directory with shell-specific completions.
- `keybidings/`: directory with shell-specific keybidings.
- `private/`: private user configuration.

The `profile` script runs first and loads other script in the  following  order:
`login`, `env`, `aliases`, `functions`. It then loads private  user  scripts  in
the `private/` directory (these ones should not be tracked  by  version  control
systems). After having figured out the current shell (`bash`, `sh`,  or  `zsh`),
it  loads  scripts  specific  to  that  shell   located   in   the   directories
`completion/`, `keybidings/`, and `plugins/`.

For example, if shell is `bash`, it could load:

- `completion/fzf.bash`,
- `completion/racket.bash`
- `keybindings/fzf.bash`
- `plugins/kitty.bash`
- `plugins/nvm.bash`
- `plugins/zoxide.bash`

If it is `zsh`, it could load:

- `completion/fzf.zsh`,
- `keybindings/fzf.zsh`
- `plugins/per-directory-history.zsh`
- `plugins/zoxide.zsh`

The files on those directories must have been previously added by the user.

The goal of this directory structure is to keep shell configuration organized.

## CONTRIBUTING

Contributions are welcome. 

## LICENSE

MIT
