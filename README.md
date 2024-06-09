# mage fish completions
Fish shell completions for Magefile targets, enabling easy navigation and execution of Mage tasks with tab completions.

Currently, it completes only the mage targets.

## About Mage

This project provides completions for [Mage](https://github.com/magefile/mage), a modern replacement for Make.

Mage is a tool that lets you write your build scripts in Go, making it easier to maintain and more powerful than traditional Makefiles.

## Usage
* Download the [mage.fish](mage.fish) file into the Fish completions folder (`~/.config/fish/completions`).
```bash
curl -o ~/.config/fish/completions/mage.fish https://raw.githubusercontent.com/d-strobel/mage-fish-completions/main/mage.fish
```
* After downloading the completion script, restart your terminal to activate the completions.
* Now you can navigate into a directory containing a Magefile, type mage in the terminal, and hit Tab to see the Mage targets with their corresponding descriptions.
