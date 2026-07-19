class Ble < Formula
  desc "Bluetooth LE CLI for macOS: scan, connect, pair, read, write, inspect, L2CAP"
  homepage "https://github.com/kylebrowning/BLESwiftCLI"
  url "https://github.com/kylebrowning/BLESwiftCLI/archive/refs/tags/1.0.0.tar.gz"
  sha256 "5df25f087b123f49582dcb4c5e7064ac310d337eeeb44cf9ab0302e9509f46bc"
  license "Apache-2.0"
  head "https://github.com/kylebrowning/BLESwiftCLI.git", branch: "main"

  depends_on xcode: ["26.0", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/ble"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ble --version")
  end
end
