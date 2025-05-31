class QuickSave < Formula
  desc     "Ultra‑simple save / load wrapper around Git"
  homepage "https://github.com/aburkov/quick-save"
  url      "https://github.com/aburkov/quick-save/archive/refs/tags/v0.0.1.tar.gz"
  sha256   "c47967dae3a010cf7f3372094b33b0f7f95cff56d89ce05d85184d996ce0ef88"
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
