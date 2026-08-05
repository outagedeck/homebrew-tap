# frozen_string_literal: true

# Installs the prebuilt OutageDeck CLI release for the current platform.
class Outagedeck < Formula
  desc "Check live cloud and SaaS status from your terminal or CI"
  homepage "https://outagedeck.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/outagedeck/cli/releases/download/v0.1.0/outagedeck_0.1.0_darwin_arm64.tar.gz"
      sha256 "1de5201480c2707f717da2afd1857c237fdf853d238368628639d295d5f5b113"
    else
      url "https://github.com/outagedeck/cli/releases/download/v0.1.0/outagedeck_0.1.0_darwin_amd64.tar.gz"
      sha256 "49e497b69e0e3ce4abde0efb89f7e3fa2baa1131ee52f87ad088b1a86aafea06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/outagedeck/cli/releases/download/v0.1.0/outagedeck_0.1.0_linux_arm64.tar.gz"
      sha256 "f8ae05f044989d41e2f82f70a3edca204083c2404f951d50cb1bdc225944fb9d"
    else
      url "https://github.com/outagedeck/cli/releases/download/v0.1.0/outagedeck_0.1.0_linux_amd64.tar.gz"
      sha256 "9e4a31d984aafe3d0219daf57152e9245b9491c510c0ed987ca9d3ce312d0520"
    end
  end

  def install
    bin.install "outagedeck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/outagedeck version")
  end
end
