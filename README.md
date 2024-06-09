![Mage](https://img.shields.io/badge/Mage-v1.15.0-blue)

# Mage fish completions
Fish shell completions for Magefile targets, enabling easy navigation and execution of Mage tasks with tab completions.

Currently, it completes only the mage targets.

## About Mage

This project provides completions for [Mage](https://github.com/magefile/mage), a modern replacement for Make.

Mage is a tool that lets you write your build scripts in Go, making it easier to maintain and more powerful than traditional Makefiles.

## Compatibility

This script has been tested with Mage version [v1.15.0](https://github.com/magefile/mage/releases/tag/v1.15.0).
Ensure you are using a compatible version for the best experience.

## Usage
* Download the [mage.fish](mage.fish) file into the Fish completions folder (`~/.config/fish/completions`).
```bash
curl -o ~/.config/fish/completions/mage.fish https://raw.githubusercontent.com/d-strobel/mage-fish-completions/main/mage.fish
```
* After downloading the completion script, restart your terminal to activate the completions.
* Now you can navigate into a directory containing a Magefile, type mage in the terminal, and hit Tab to see the Mage targets with their corresponding descriptions.

## License

This project is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more details.
