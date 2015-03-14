require "formula"

class Kf5Solid < Formula
  url "http://download.kde.org/stable/frameworks/5.7/solid-5.7.0.tar.xz"
  sha1 "5e1e2f9ff4f45806fd9b5e65ee394446697ee358"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/solid.git'

  depends_on "cmake" => :build
  depends_on "kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
