# Pixel Perfect Homebrew tap

Homebrew casks for Pixel Perfect's macOS apps.

```sh
brew install --cask pixel-perfect-software/tap/envrouter
```

| Cask | App |
|---|---|
| [`envrouter`](Casks/envrouter.rb) | [EnvRouter](https://github.com/pixel-perfect-software/env-router): picks each coding agent's account and MCP servers from the folder it runs in |

The apps are signed ad hoc rather than with an Apple Developer ID, so they aren't notarized.
Each cask clears the quarantine flag on its download so macOS will open the app; you're
trusting this tap and the app's release workflow, which builds it from the tagged source on
GitHub Actions.

Each app's own repository publishes its releases and updates its cask here. To build an app
from source instead, see its README.
