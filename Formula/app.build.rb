class AppBuild < Formula
  desc "CLI for building applications"
  homepage "https://app.build"
  url "https://registry.npmjs.org/@app.build/cli/-/cli-1.14.0.tgz"
  sha256 "77ac22b26bb7bf13f1a6536c0d471197129cc419a3cbff847d13ea53fe173529"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/appdotbuild/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a06c50efc10ac2f915cdc66d39f56d0b164ccd28f6d640278132dbe435460232"
    sha256 cellar: :any_skip_relocation, ventura:       "d2ffe2f8c1e18999302a1995e2c3125b7b8e9acd2587e6a725be129eb5edcbb2"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d4f7aa923eb5bfef1685e16e338bee76d1516047723677c7c224abe070aac2e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0618dfc36227f000d8e06e6a7218796c03029d36f9d17c7937b22f0ecdfbce00"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]

    ln_s bin/"app.build", bin/"appdotbuild"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/app.build --version")
  end
end
