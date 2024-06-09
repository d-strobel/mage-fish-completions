# mage fish completions
Fish shell completions for Magefile targets, enabling easy navigation and execution of Mage tasks with tab completions.

Currently, it completes only the mage targets.

## Usage
* Download the [mage.fish](mage.fish) file into the Fish completions folder (`~/.config/fish/completions`).
```bash
curl -o ~/.config/fish/completions/mage.fish https://raw.githubusercontent.com/d-strobel/mage-fish-completions/main/mage.fish
```
* After downloading the completion script, restart your terminal to activate the completions.
* Now you can navigate into a directory containing a Magefile, type mage in the terminal, and hit Tab to see the Mage targets with their corresponding descriptions.
