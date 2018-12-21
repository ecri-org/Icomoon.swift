# Use like:
# brew install https://raw.githubusercontent.com/jamiely/Icomoon.swift/master/icomoon-swift.rb
#
class IcomoonSwift < Formula
  desc "Use your Icomoon fonts with Swift - auto-generates type safe enums for each icon"
  homepage "https://github.com/jamiely/Icomoon.swift"
  url "https://github.com/jamiely/Icomoon.swift/archive/20181220.tar.gz"
  sha256 "2e02d83d5de76d8938c6ec671abefebf5ec7e6ffae8c7275e27ea2e1e05e9fb3"

  skip_clean "lib/icomoon-swift/Icomoon"

  def install
    mv "run.sh", "icomoon-swift"
    bin.install "icomoon-swift"
    chmod_R "u+rw", "Icomoon"
    (lib/"icomoon-swift").install Dir["**"] - Dir["icomoon-swift"]
    chmod_R "u+w", lib/"icomoon-swift/Icomoon"
  end

  test do
    system "#{bin}/icomoon-swift"
  end
end
