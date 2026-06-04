class Overwatch < Formula
  desc "Live terminal dashboard for iTerm2 tabs"
  homepage "https://github.com/burnsbert/overwatch-for-iterm2"
  url "https://github.com/burnsbert/overwatch-for-iterm2/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "d76db6c9e1ecf3150d637d25d889c1c7e25b663c0f4fc805e191b8aa4d60e0a1"
  license "MIT"

  depends_on :macos

  def install
    bin.install "overwatch"
  end

  def caveats
    <<~EOS
      Overwatch requires Python 3.7+, provided by Xcode Command Line Tools.
      If you don't have them installed:
        xcode-select --install
    EOS
  end

  test do
    assert_predicate bin/"overwatch", :executable?
    system "python3", "-c", "import py_compile; py_compile.compile('#{bin}/overwatch', doraise=True)"
  end
end
