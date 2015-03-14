require "formula"

class Kdewebkit < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kdewebkit-5.8.0.tar.xz"
  sha1 "c1e5bf22f6081ab5833836868a0b09a0ae335074"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/attica.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kparts"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
