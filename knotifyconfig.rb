require "formula"

class Knotifyconfig < Formula
  url "http://download.kde.org/stable/frameworks/5.7/knotifyconfig-5.7.0.tar.xz"
  sha1 "95ebed9be15076e0eb595ad9b7bd46af696479d5"
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
