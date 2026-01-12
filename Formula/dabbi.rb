# typed: false
# frozen_string_literal: true

class Dabbi < Formula
  desc "Isolated Linux environments for AI coding agents"
  homepage "https://github.com/mjshashank/dabbi"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
    end
  end

  depends_on cask: "multipass"

  def install
    bin.install "dabbi"
  end

  def caveats
    <<~EOS
      dabbi requires multipass to be installed and running.

      To start the daemon (port 80 requires sudo):
        sudo dabbi serve

      Or on a different port:
        dabbi serve --port 8080

      Your auth token is stored in ~/.dabbi/config.json

      Access the web UI at http://localhost
    EOS
  end

  test do
    assert_match "dabbi", shell_output("#{bin}/dabbi --help")
  end
end
