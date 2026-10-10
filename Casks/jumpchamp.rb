cask "jumpchamp" do
  arch arm: "arm64", intel: "intel-x86_64"
  version "1.0.1"
  sha256 arm:   "4e8e0448c4e01348b11a206cf4963645d4f3425bd99b3e884070e37614f54a1d",
         intel: "2f8e767c010dab275a08edd1ffe2d6a69dbbaff575a97b0f38860a129f34c813"

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
