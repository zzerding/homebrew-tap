class TmWatcher < Formula
  desc "Automatically manage macOS Time Machine exclusions for development directories"
  homepage "https://github.com/zzerding/tm-exclude-watcher"
  license "MIT"
  version "0.2.0"

  if Hardware::CPU.arm?
    url "https://github.com/zzerding/tm-exclude-watcher/releases/download/v0.2.0/tm-watcher-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "9a31930dd6d58276bc2cfbe2ef0235c8baf51cacdf39119f14732952431ae9a3"
  else
    url "https://github.com/zzerding/tm-exclude-watcher/releases/download/v0.2.0/tm-watcher-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "9124b6804f8d887815afec7723ea67ff407f773e559ca23ed3c25564e0099ceb"
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
        tm-watcher start

      To check daemon status:
        tm-watcher status

      To stop background monitoring:
        tm-watcher stop
    EOS
  end
end
