class Overwatch < Formula
  desc "Live terminal dashboard for iTerm2 tabs"
  homepage "https://github.com/burnsbert/overwatch-for-iterm2"
  url "https://github.com/burnsbert/overwatch-for-iterm2/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "e52af3f93ec84791c2c5bb5266600d6a7e39c24311762272ae0acb0166f00aac"
  license "MIT"

  depends_on :macos

  def install
    bin.install "overwatch"
  end

  test do
    assert_predicate bin/"overwatch", :executable?
  end
end
