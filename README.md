# normanius-zsh-theme

My preferred [Oh My Zsh](https://ohmyz.sh/) theme, derived from [Bira](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/bira.zsh-theme).



## Instructions

Copy the theme to `~/.oh-my-zsh/themes/`:

```bash
URL="https://raw.githubusercontent.com/normanius/"
URL+="normanius-zsh-theme/main/normanius.zsh-theme"
wget "$URL" -O ~/.oh-my-zsh/themes/normanius.zsh-theme
```

Open the `~/.zshrc` and set the variable `ZSH_THEME=normanius`.

```bash
vim `~/.zshrc`
# ZSH_THEME=normanius
```

Re-source the current shell session to activate the theme.

```bash
source ~/.zshrc
```


## Screenshots

- `multi_line=true` 
- `show_user=true`

![multi_line](screenshots/normanius-multi-line.png)

--

- `multi_line=false` 
- `show_user=false`

![multi_line](screenshots/normanius-single-line.png)
