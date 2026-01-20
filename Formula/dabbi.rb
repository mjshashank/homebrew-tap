# typed: false
# frozen_string_literal: true

class Dabbi < Formula
  desc "Isolated Linux environments for AI coding agents"
  homepage "https://github.com/mjshashank/dabbi"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-arm64.tar.gz"
      sha256 "7b258c1399de91a7dfd6ea859424731525f24f6252c9db904861ec5c127a73f8"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-amd64.tar.gz"
      sha256 "4fb3a0eb0d0988400648b46155e631b083f149adf5f451a0aebd52a6b0b168b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-arm64.tar.gz"
      sha256 "0372aba80346991deefd9f8f3ff94dc09111b2086139dbe86669327e60663877"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-amd64.tar.gz"
      sha256 "80954064216588fb862da62cc43dd2d4b4e41ede0e772cc46d20ec43db0768db"
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
