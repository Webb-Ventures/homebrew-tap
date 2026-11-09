cask "mergepond" do
  version "1.0.5"
  sha256 "df44cd7a3125f86e6563b396ffc543e035ba522bd28b7a0f54e09f778ff0d29d"

  url "https://api.mergepond.dev/releases/darwin/#{version}/Mergepond_#{version}_universal.dmg",
      verified: "api.mergepond.dev/releases/"
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
  depends_on macos: ">= :ventura"

  app "Mergepond.app"

  zap trash: [
    "~/Library/Application Support/dev.mergepond.app",
    "~/Library/Caches/dev.mergepond.app",
    "~/Library/HTTPStorages/dev.mergepond.app",
    "~/Library/Preferences/dev.mergepond.app.plist",
    "~/Library/Saved Application State/dev.mergepond.app.savedState",
    "~/Library/WebKit/dev.mergepond.app",
  ]
end
