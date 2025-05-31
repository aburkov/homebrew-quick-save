class QuickSave < Formula
  desc     "Ultra‑simple save / load wrapper around Git"
  homepage "https://github.com/aburkov/quick-save"
  url      "https://github.com/aburkov/quick-save/archive/refs/tags/v1.0.0.tar.gz"
  sha256   "<PASTE_HASH_HERE>"
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
