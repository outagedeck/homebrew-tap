# frozen_string_literal: true

# Installs the prebuilt OutageDeck CLI release for the current platform.
class Outagedeck < Formula
  desc "Check live cloud and SaaS status from your terminal or CI"
  homepage "https://outagedeck.com"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/outagedeck/cli/releases/download/v0.1.1/outagedeck_0.1.1_darwin_arm64.tar.gz"
      sha256 "acf7ebf516c89600d34b319209693bb054cee3c093708021c1e04f94ea194a4d"
    else
      url "https://github.com/outagedeck/cli/releases/download/v0.1.1/outagedeck_0.1.1_darwin_amd64.tar.gz"
      sha256 "e87784af126a604b27a9756a4de0f3d5627da6cd1b140f8cb0c43f4fd2ceb66b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/outagedeck/cli/releases/download/v0.1.1/outagedeck_0.1.1_linux_arm64.tar.gz"
      sha256 "e264e602bd3d3e2c8256374e6aea9119e702d3fc8dc9d856713907121ee77221"
    else
      url "https://github.com/outagedeck/cli/releases/download/v0.1.1/outagedeck_0.1.1_linux_amd64.tar.gz"
      sha256 "6a8f86a4f0c86ba5add99eaf6c524e1354a0f49b226fd356b67c09867f0bab32"
    end
  end

  def install
    bin.install "outagedeck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/outagedeck version")
  end
end
