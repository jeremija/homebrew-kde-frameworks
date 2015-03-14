require "formula"

class Kio < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kio-5.7.0.tar.xz"
  sha1 "9897aafc8c6e27f6e4d3112cead3db83f903897b"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kio.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "karchive"
  depends_on "kbookmarks"
  depends_on "kjobwidgets"
  depends_on "kwallet"
  depends_on "solid"

  def install
    args = std_cmake_args
    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"
    args << "-DCMAKE_C_FLAGS='-D_DARWIN_C_SOURCE'"
    args << "-DCMAKE_REQUIRED_DEFINITIONS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
