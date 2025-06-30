class AppBuild < Formula
  desc "CLI for building applications"
  homepage "https://app.build"
  url "https://registry.npmjs.org/@app.build/cli/-/cli-1.25.0.tgz"
  sha256 "3f8454f54ba2642bb74aaf7a02fdb9ad6015087370eb78633d4627fb9d7cb28e"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/appdotbuild/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "41eecfee09fe9fdb90e0643936d87ed715294183157f311a38271a7553f34658"
    sha256 cellar: :any_skip_relocation, ventura:       "b55839b81ea5aabd7418a11ad82bbae8db384b3b9919792d78483f6881cf20cb"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "c24dbe1a5abbe8a992e0f39e1751e2a04477e540745cb631fe030264d5d1c2d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5d2c2a894658fb3be1c603b2cfce6217ec319e8ceed691d52c780cbb893dec5e"
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
