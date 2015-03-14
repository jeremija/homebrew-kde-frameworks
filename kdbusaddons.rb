require "formula"

class Kdbusaddons < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kdbusaddons-5.8.0.tar.xz"
  sha1 "c08022914d159e85d875bc6d9e292dacec8a6ac6"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kdbusaddons.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "shared-mime-info"
  depends_on "d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
