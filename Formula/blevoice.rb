class Blevoice < Formula
  desc "Live transcription of audio streamed over BLE, with per-utterance command execution"
  homepage "https://github.com/kylebrowning/blevoice"
  url "https://github.com/kylebrowning/blevoice/archive/refs/tags/0.1.0.tar.gz"
  sha256 "268cdbc4233bf565bde35607933c917bfdead74bc6f1f39eaccde1d2238860cf"
  license "Apache-2.0"
  head "https://github.com/kylebrowning/blevoice.git", branch: "main"

  depends_on xcode: ["26.0", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/blevoice"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blevoice --version")
  end
end
