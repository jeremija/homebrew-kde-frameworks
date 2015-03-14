require "formula"

class Knotifications < Formula
  url "http://download.kde.org/stable/frameworks/5.7/knotifications-5.7.0.tar.xz"
  sha1 "4514c2e6168563242f254eed97d3aa1b47db0a6c"
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
