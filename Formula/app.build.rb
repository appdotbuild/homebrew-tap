class AppBuild < Formula
  desc "CLI for building applications"
  homepage "https://app.build"
  url "https://registry.npmjs.org/@app.build/cli/-/cli-1.28.0.tgz"
  sha256 "66f2f710e734d7bdfe8ff09611b3982ba5c025f42351b9e878a46a748181f624"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/appdotbuild/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c6d69d98579ddcb6ad9c359262c7e4d85efff4c4b0e67ef4957b0cd28ea8ff1c"
    sha256 cellar: :any_skip_relocation, ventura:       "f551f2901db5572024dc6588c557e90618062898b9914b2e73d700075fef30bb"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d4913d0fd9ba4afd2f87a6fc068262aeb7809353f1a5f3ea5429c5350b811bd0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8e098d105bd3e30f32ef5a06a1ac8ab7a9d24865055688576a285b948c6c3102"
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
