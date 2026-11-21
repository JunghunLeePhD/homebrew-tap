cask "jumpchamp" do
  arch arm: "arm64", intel: "intel-x86_64"
  version "1.0.1"
  sha256 arm:   "bbd6a8d86ca2c6c7be5e5ebe7f80eb21cc13b6e69390fea4ae24aab47b23426c",
         intel: "84db1fb303ec676cfae95258cf8a6f7941e99a6e26f144a4a14de6b32aad2bf9"

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
