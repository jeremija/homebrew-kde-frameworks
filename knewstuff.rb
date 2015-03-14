require "formula"

class Knewstuff < Formula
  url "http://download.kde.org/stable/frameworks/5.7/knewstuff-5.7.0.tar.xz"
  sha1 "8447b28d35416cc48344a44841412c6a647dbc99"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/knewstuff.git'

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
