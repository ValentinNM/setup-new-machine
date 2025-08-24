##  To get started

1. Clone the repo:
    ```bash
    git clone <repo_url> && cd <repo_folder>
    ```
2. Make the installer script executable and run it:
    ```bash
    chmod +x bootstrap.sh
    ./bootstrap.sh
    ```
    - Installs Homebrew if it's missing
    - Runs `brew bundle` to install everything listed in `Brewfile`
    - Cleans up with `brew cleanup` and `brew autoremove`

---

##  Pro Tips & Workflow

- Use `brew bundle check` to verify the Brewfile dependencies without changing anything :contentReference[oaicite:4]{index=4}.
- To remove anything not listed in the Brewfile, run:
  ```bash
  brew bundle cleanup --force
