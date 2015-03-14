require "formula"

class Frameworkintegration < Formula
  url "http://download.kde.org/stable/frameworks/5.7/frameworkintegration-5.7.0.tar.xz"
  sha1 "9f8b1f6c6d26208aeaa8bbae7634e89cef2037b7"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/frameworkintegration.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "kio"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
  end
end
