class Mrsk < Formula
  desc "Manage Git worktrees beside a configured main checkout"
  homepage "https://github.com/mrsk-cli/mrsk"
  url "https://github.com/mrsk-cli/mrsk/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "29a0dd8d30897eff21470d97902b7b2551da1d9c57e27385485a3b70a15c744e"
  license "MIT"

  depends_on "open-code-review"
  uses_from_macos "git"
  uses_from_macos "ruby"
  uses_from_macos "zsh"

  def install
    system "make", "mrsk"
    bin.install "mrsk"

    if OS.mac?
      system "make", "macos-app"
      libexec.install "dist/Worktree Target Branch Updater.app"
      updater = libexec/"Worktree Target Branch Updater.app"/"Contents/Resources/worktree-target-branch-updater"
      bin.install_symlink updater
    else
      bin.install "worktree-target-branch-updater"
    end
  end

  test do
    assert_match "mrsk()", shell_output("#{bin}/mrsk shell-init")
    assert_match "ocr review", shell_output("#{bin}/mrsk review --help")
  end
end
