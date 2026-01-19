# typed: false
# frozen_string_literal: true

class Dabbi < Formula
  desc "Isolated Linux environments for AI coding agents"
  homepage "https://github.com/mjshashank/dabbi"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-arm64.tar.gz"
      sha256 "2f63be6351b227993ee09d1c828ef58d3d5b4424a69eaa171baad72142f8e922"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-amd64.tar.gz"
      sha256 "cc2854f2204883fde9bb29c24061f47d903a30e8f0085ebe8cc438830a9950d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-arm64.tar.gz"
      sha256 "d2cfa1748e9bb66babc90b40ecaca5261006e905fa538b65bf9c5791e9a8a821"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-amd64.tar.gz"
      sha256 "1721c67a9b42cb86d91fe6e5011a9aa0e6a07a6346f1ff6499dbacec863f410e"
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
