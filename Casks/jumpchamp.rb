cask "jumpchamp" do
  arch arm: "arm64", intel: "intel-x86_64"

  version "1.5.0"
  sha256 arm:   "sha256:3a4b59ddf6cf3d7b0bda774eddc2b340720a2fa8f0214fe733a251153c50ee18",
         intel: "sha256:9568ae34e31c7c3cc0cf8c4d22e3556c557f44e4b1ec2334a10a0548ccff4761"

  url "https://github.com/JunghunLeePhD/jumpchamp/releases/download/v#{version}/JumpChamp-macos-#{arch}.app.zip"
  name "JumpChamp"
  desc "High-performance prime gap distribution explorer and analyzer"
  homepage "https://github.com/JunghunLeePhD/jumpchamp"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "JumpChamp.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/JumpChamp.app"]
  end

  zap trash: [
    "~/.jumpchamp",
    "~/Library/Application Support/jumpchamp",
    "~/Library/Preferences/com.jumpchamp.gui.plist",
  ]
end
