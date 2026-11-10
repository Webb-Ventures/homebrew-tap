cask "mergepond" do
  version "1.1.1"
  sha256 "e77d1513bc1ad87769254b168c05f54faed861c52a2f78ffab09932ea3dd8578"

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
