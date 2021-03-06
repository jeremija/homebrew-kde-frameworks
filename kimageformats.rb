require "formula"

class Kimageformats < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kimageformats-5.8.0.tar.xz"
  sha1 "aa8a16046e106b5eacbb307fc7b11f3b742c0b86"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kimageformats.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "openexr"
  depends_on "jasper"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
