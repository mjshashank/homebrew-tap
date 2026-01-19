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
      sha256 "665953f2eb4e45100ff6c1ed9d79f7083630d0e55dd5ac84c4dce4606bb03835"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-amd64.tar.gz"
      sha256 "9cde6694fb32c71ff0841e7b39ecf53d742b3e777b9ca3ced260acf29d116591"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-arm64.tar.gz"
      sha256 "da7f401dc97fccb24b5cd966b23048bed2f55ff5417b14a3c8db667025ca2fff"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-amd64.tar.gz"
      sha256 "3d9e2c5f20ecc6901995af0b30d181e3789481a9f8210b614b9976748b6210a4"
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
