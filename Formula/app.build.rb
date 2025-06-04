class AppBuild < Formula
  desc "CLI for building applications"
  homepage "https://app.build"
  url "https://registry.npmjs.org/@app.build/cli/-/cli-1.14.0.tgz"
  sha256 "77ac22b26bb7bf13f1a6536c0d471197129cc419a3cbff847d13ea53fe173529"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/appdotbuild/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1d30a612c5a71bde857fc54be0b9067e5d37806b0d2d5d7267a45fb31075ef99"
    sha256 cellar: :any_skip_relocation, ventura:       "c12df5d4f296a0ac8ca4b7b3b1d5cc289b5e3f86a831a6cc11cab24dc834430a"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "af6154fb3c5647bec350d476bd86b8478673089919a7a83e13f027f1c7e751c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bb7e590fec05568b3827226e3ff9d53d207b1e0d79f9f8976b4afffbd7fc0362"
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
