# tmux-harpoon

## Setup
1. Clone this repo
2. *optional* create an alias for tmux-harpoon
```bash
echo "alias harpoon=$REPO_PATH"
```
3. Add to .tmux.conf
```bash
bind-key 1 run-shell "harpoon -s 1"
bind-key 2 run-shell "harpoon -s 2"
bind-key 3 run-shell "harpoon -s 3"
bind-key 4 run-shell "harpoon -s 4"
bind-key 5 run-shell "harpoon -s 5"
bind-key A run-shell "tmux display-message -p '#S' | harpoon -a $_"
bind-key a run-shell "harpoon -l"
```

## Keymaps
- prefix-a allows you see a popup of vim that shows the session list
- prefix-A allows you to add the current session to the session list 
- prefix-1 allows you to jump to the first session in the list
- prefix-2 allows you to jump to the second session in the list
- prefix-3 allows you to jump to the third session in the list
- prefix-4 allows you to jump to the fourth session in the list
- prefix-5 allows you to jump to the fifth session in the list
