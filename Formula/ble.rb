class Ble < Formula
  desc "Bluetooth LE CLI for macOS: scan, connect, pair, read, write, inspect, L2CAP"
  homepage "https://github.com/kylebrowning/BLESwiftCLI"
  url "https://github.com/kylebrowning/BLESwiftCLI/archive/refs/tags/1.0.0.tar.gz"
  sha256 "39ea024ff76f92ad200ab02854ee6a0f6ce1183a2e8b7803029128ef7b5f22bf"
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
