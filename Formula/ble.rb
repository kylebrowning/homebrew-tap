class Ble < Formula
  desc "Bluetooth LE CLI for macOS: scan, connect, pair, read, write, inspect, L2CAP"
  homepage "https://github.com/kylebrowning/BLESwiftCLI"
  url "https://github.com/kylebrowning/BLESwiftCLI/archive/refs/tags/1.1.1.tar.gz"
  sha256 "82b89438aba1fab0d1109e218b44b6836432cf9ea17656cecd1ee925349f5fc7"
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
