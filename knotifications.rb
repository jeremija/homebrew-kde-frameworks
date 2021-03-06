require "formula"

class Knotifications < Formula
  url "http://download.kde.org/stable/frameworks/5.8/knotifications-5.8.0.tar.xz"
  sha1 "d7c784173c96fb598e61046cf6f818a8d2dd7d5d"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/knotifications.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  depends_on "kiconthemes"
  depends_on "kservice"
  depends_on "phonon"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
