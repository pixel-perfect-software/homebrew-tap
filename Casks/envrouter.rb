# Updated by env-router's release workflow, which rewrites `version` and `sha256` for each
# release (https://github.com/pixel-perfect-software/env-router/blob/main/.github/workflows/release.yml).
# Don't edit those two lines by hand.
cask "envrouter" do
  version "0.1.0"
  sha256 "3ccd911b72eeaf4185b71bd112d23882ddec1f897cdfd75ca923602d33250844"

  url "https://github.com/pixel-perfect-software/env-router/releases/download/v#{version}/EnvRouter-#{version}-arm64.zip"
  name "EnvRouter"
  desc "Picks each coding agent's account and MCP servers from the folder it runs in"
  homepage "https://github.com/pixel-perfect-software/env-router"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The bundle is arm64-only for now. It needs macOS 11, older than any Homebrew supports.
  depends_on arch: :arm64
  depends_on :macos

  app "EnvRouter.app"

  # The app is signed ad hoc, without an Apple Developer ID, so it isn't notarized: clear the
  # quarantine flag on the download, or Gatekeeper won't open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-cr", "{{appdir}}/EnvRouter.app"],
        writable_paths: ["{{appdir}}/EnvRouter.app"]
  end

  uninstall quit: "com.tylerrobertson.envrouter"

  zap trash: [
    "~/.envrouter",
    "~/Library/Caches/com.tylerrobertson.envrouter",
    "~/Library/WebKit/com.tylerrobertson.envrouter",
  ]

  caveats <<~EOS
    Before uninstalling, open EnvRouter and turn off every shell (Shells…) and editor
    (Editors…), so it takes its lines back out of your startup files and editor settings.
    MCP secrets stay in the "EnvRouter MCP secrets" Keychain item until you delete it.
  EOS
end
