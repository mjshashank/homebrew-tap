# typed: false
# frozen_string_literal: true

class Dabbi < Formula
  desc "Isolated Linux environments for AI coding agents"
  homepage "https://github.com/mjshashank/dabbi"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-arm64.tar.gz"
      sha256 "df183201d40fb05a81698d1ea5d5fbda23f6b13c8c4d7581c3bbf3e19448772d"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-darwin-amd64.tar.gz"
      sha256 "9ae1a9ff83be9d21bc156d323c0c67a8f3756a7732ef9f99182f586d3a5a0e14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-arm64.tar.gz"
      sha256 "735a76f334432c6e859e7308c92b169054d76af242d5c7274e51ad02f7ddae9d"
    end
    on_intel do
      url "https://github.com/mjshashank/dabbi/releases/download/v#{version}/dabbi-linux-amd64.tar.gz"
      sha256 "4e6b112cc3249a42d296d102fbd413241debbaa5e651dffb40d7961abd2a65cc"
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
