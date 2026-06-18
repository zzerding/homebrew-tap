class TmWatcher < Formula
  desc "Automatically manage macOS Time Machine exclusions for development directories"
  homepage "https://github.com/zzerding/tm-exclude-watcher"
  license "MIT"
  version "0.3.0"

  if Hardware::CPU.arm?
    url "https://github.com/zzerding/tm-exclude-watcher/releases/download/v0.3.0/tm-watcher-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "7148a22636fb71dbf67489399647d6cfa49fbb5cced514b80e9d199844f2fdfe"
  else
    url "https://github.com/zzerding/tm-exclude-watcher/releases/download/v0.3.0/tm-watcher-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "987bd7988152b304353ee0941a3e0f63752732bdd9b64fd97abbb5d260d0e75e"
  end

  def install
    bin.install "tm-watcher"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tm-watcher --version")
    assert_match "tm-watcher", shell_output("#{bin}/tm-watcher --help")
  end

  def caveats
    <<~EOS
      tm-watcher is installed but not started automatically.

      To enable background monitoring:
        tm-watcher daemon start

      To check daemon status:
        tm-watcher daemon status

      To stop background monitoring:
        tm-watcher daemon stop
    EOS
  end
end
