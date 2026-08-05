# frozen_string_literal: true

# Installs the prebuilt OutageDeck Prometheus exporter for the current platform.
class OutagedeckPrometheusExporter < Formula
  desc "Export live cloud and SaaS provider status as Prometheus metrics"
  homepage "https://github.com/outagedeck/prometheus-exporter"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/outagedeck/prometheus-exporter/releases/download/v0.2.0/outagedeck-prometheus-exporter_0.2.0_darwin_arm64.tar.gz"
      sha256 "54764b71c1aea58da843bb1c1efecd5a89486278fdbbfe5d0815474e0634c316"
    else
      url "https://github.com/outagedeck/prometheus-exporter/releases/download/v0.2.0/outagedeck-prometheus-exporter_0.2.0_darwin_amd64.tar.gz"
      sha256 "7408cf3c05484c1ac7a67980c82d9a3130523288ab8b9f24b3246cf87c5981e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/outagedeck/prometheus-exporter/releases/download/v0.2.0/outagedeck-prometheus-exporter_0.2.0_linux_arm64.tar.gz"
      sha256 "a770ae41f8bcc7111304901a9baf35a6b2128ce5a1d7176acbbdf41fa6600ed3"
    else
      url "https://github.com/outagedeck/prometheus-exporter/releases/download/v0.2.0/outagedeck-prometheus-exporter_0.2.0_linux_amd64.tar.gz"
      sha256 "b650a844cccee4835aaae9f50487cd0892709f86a9b7e1bbed159a3d206101b2"
    end
  end

  def install
    bin.install "outagedeck-prometheus-exporter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/outagedeck-prometheus-exporter --version")
  end
end
