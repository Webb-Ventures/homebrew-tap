cask "mergepond" do
  version "1.4.1"
  sha256 "4f22d73dbe0adfc3d5d9f58962a205ad80cc7e1954a14db236b191a8f566d57d"

  url "https://api.mergepond.dev/releases/darwin/#{version}/Mergepond_#{version}_universal.dmg"
  name "Mergepond"
  desc "Git client for worktrees, workspaces and remote repos"
  homepage "https://mergepond.dev/"

  livecheck do
    url "https://api.mergepond.dev/releases/darwin/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "Mergepond.app"
  binary "#{appdir}/Mergepond.app/Contents/Resources/agents/pond"

  zap trash: [
    "~/Library/Application Support/dev.mergepond.app",
    "~/Library/Caches/dev.mergepond.app",
    "~/Library/HTTPStorages/dev.mergepond.app",
    "~/Library/Preferences/dev.mergepond.app.plist",
    "~/Library/Saved Application State/dev.mergepond.app.savedState",
    "~/Library/WebKit/dev.mergepond.app",
  ]
end
