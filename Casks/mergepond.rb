cask "mergepond" do
  version "1.0.4"
  sha256 "61b6dd2ded383d3710509edb8cb8c512aeb61eb8540d8aa1e6ccc7dfa5f31138"

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
