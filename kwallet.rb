require "formula"

class Kwallet < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kwallet-5.7.0.tar.xz"
  sha1 "9a297ff2812e71df83eeab8a1a5d46a11cb6dc31"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kwallet.git'

  depends_on "libgcrypt"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "knotifications"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
