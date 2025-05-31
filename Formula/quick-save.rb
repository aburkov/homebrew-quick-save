class QuickSave < Formula
  desc     "Ultra‑simple save / load wrapper around Git"
  homepage "https://github.com/aburkov/quick-save"
  url      "https://github.com/aburkov/quick-save/archive/refs/tags/v0.0.2.tar.gz"
  sha256   "63d8a273525c712b1bc0119cd9836560ebec120ebda22834af2818e767c7ac22"
  license  "MIT"

  depends_on "git"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"save_load")
    bin.install_symlink "save_load" => "save"
    bin.install_symlink "save_load" => "load"
  end

  test do
    system "#{bin}/save_load", "--help"
  end
end
