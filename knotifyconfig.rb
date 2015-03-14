require "formula"

class Knotifyconfig < Formula
  url "http://download.kde.org/stable/frameworks/5.8/knotifyconfig-5.8.0.tar.xz"
  sha1 "2b874c9adf980ed9e547918ea5779ac0310b4e52"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/knotifyconfig.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "kio"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
