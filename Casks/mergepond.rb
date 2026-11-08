cask "mergepond" do
  version "1.0.0"
  sha256 "74dbd422e4b1f7402026a737abcd4b5fb22644ecedff079e609bfddb21c3a3cc"

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
