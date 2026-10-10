cask "jumpchamp" do
  arch arm: "arm64", intel: "intel-x86_64"
  version "1.0.1"
  sha256 arm:   "979cd142b83d9bd25c870c923aea6ccb45f94e0fe26eb9685b520dc7183ffb3a",
         intel: "e0ff0ff833dd99aac2859e150308ac3b93b230cf2bbe6ba025f56386c2635de0"

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
