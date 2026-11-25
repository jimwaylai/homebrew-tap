# Template: scripts/release.sh fills in the version, checksum and repo.
cask "ocfloat" do
  version "0.1.0"
  sha256 "2116bc85e0eae2a27b4a70b1d49a401ccde5c56f6b17d367ab75245f63467bab"

  url "https://github.com/jimwaylai/ocfloat/releases/download/v#{version}/ocfloat-#{version}.dmg"
  name "ocfloat"
  desc "Floating Quick Chat for opencode, summoned with a global shortcut"
  homepage "https://github.com/jimwaylai/ocfloat"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "ocfloat.app"

  uninstall quit:       "tw.com.shitu.ocfloat",
            login_item: "ocfloat"

  zap trash: [
    "~/Library/Application Support/tw.com.shitu.ocfloat",
    "~/Library/Caches/tw.com.shitu.ocfloat",
    "~/Library/HTTPStorages/tw.com.shitu.ocfloat",
    "~/Library/Preferences/tw.com.shitu.ocfloat.plist",
  ]
end
