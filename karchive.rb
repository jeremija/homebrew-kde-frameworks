require "formula"

class Karchive < Formula
  url "http://download.kde.org/stable/frameworks/5.7/karchive-5.7.0.tar.xz"
  sha1 "fda59fe0dd22fda0d658d38d4d3e66a5da67db21"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/karchive.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
