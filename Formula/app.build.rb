class AppBuild < Formula
  desc "CLI for building applications"
  homepage "https://app.build"
  url "https://registry.npmjs.org/@app.build/cli/-/cli-1.17.0.tgz"
  sha256 "2d74bfab5cc5e1e0b01594ca629c967816a7c0311527b57ebe2da6f43942a1ad"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/appdotbuild/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "14e1ca474b7aea55ced1106771b6f4892d5b92408799cf825b0df742eef4479e"
    sha256 cellar: :any_skip_relocation, ventura:       "561080b0a69b0c25e1d8bfd10cde14a064142a402b174a7dc767c23506699e0f"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "a1e2ad99af034f7d403a118e470fd99b90aa98be159cbb07eb87a7a5f93b32d3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "062cfa7f031c13b01952a91c0301224ff1d7968ee3d631eeb070fe753df7ff43"
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
