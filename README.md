# mrsk Homebrew tap

Install [mrsk](https://github.com/mrsk-cli/mrsk) with Homebrew:

```sh
brew install mrsk-cli/tap/mrsk
echo 'eval "$(mrsk shell-init)"' >> "$HOME/.zshrc"
```

Open a new zsh session to enable the worktree shortcut. The formula also
installs `ocr` for `mrsk review`.

Formulae are kept in [`Formula/`](Formula). Each release is pinned to a source
archive and SHA-256 checksum.
