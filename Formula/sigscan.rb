class Sigscan < Formula
  desc "Inspect container images and other artifacts for signatures"
  homepage "https://github.com/venafi/sigscan"
  url "https://github.com/venafi/sigscan/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "29c47a8274b9452b510ea21a827ab033e2eeb01abf2abf3bcaea0319e572e8d2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/sigscan/releases/download/v0.3.0/sigscan-darwin-amd64"
      sha256 "a721fddfd54c68d7afeeb811df443d7e90483ec76654b66d8f1020c53b4c43ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/sigscan/releases/download/v0.3.0/sigscan-linux-amd64"
      sha256 "0005bf25ac188e13f88499b38fca37089ad5648451b445833b468e2c830ac03f"
    end
  end

  def install
    cpu = "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "sigscan-#{os}-#{cpu}" => "sigscan"
  end

  test do
    # Validate install
    system "#{bin}/sigscan", "version"
  end
end
