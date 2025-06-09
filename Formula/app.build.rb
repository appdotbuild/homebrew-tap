class AppBuild < Formula
  desc "CLI for building applications"
  homepage "https://app.build"
  url "https://registry.npmjs.org/@app.build/cli/-/cli-1.17.0.tgz"
  sha256 "2d74bfab5cc5e1e0b01594ca629c967816a7c0311527b57ebe2da6f43942a1ad"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/appdotbuild/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1a11fd5a9d133d98f8a8793a60e6f719c74c486a1ecf1408cec5a496ab804b4a"
    sha256 cellar: :any_skip_relocation, ventura:       "b935b662ba5eb9887d1f7f524609a742c78883e8a29004465af0e86f667ff84f"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "e95f52f3b4b29ac69d636608a7f2f6868233aeaf3ce7f8fa25f89389ef456453"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "46797fdafe4e61231371323bf9694415136af60b14707e4ecdb14f9696972300"
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
