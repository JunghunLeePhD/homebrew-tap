cask "jumpchamp" do
  arch arm: "arm64", intel: "intel-x86_64"

  version "1.0.1"
  sha256 arm:   "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5",
         intel: "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  url "https://github.com/JunghunLeePhD/jumpchamp/releases/download/v#{version}/JumpChamp-macos-#{arch}.app.zip"
  name "JumpChamp"
  desc "High-performance prime gap distribution explorer and analyzer"
  homepage "https://github.com/JunghunLeePhD/jumpchamp"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "JumpChamp.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/JumpChamp.app"]
  end

  zap trash: [
    "~/.jumpchamp",
    "~/Library/Application Support/jumpchamp",
    "~/Library/Preferences/com.jumpchamp.gui.plist",
  ]
end
