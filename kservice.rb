require "formula"

class Kservice < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kservice-5.8.0.tar.xz"
  sha1 "30c5d582efb0c21447c5b018df6af54a1c764f7a"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kservice.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "kcrash"
  depends_on "kdoctools"
  depends_on "kdbusaddons"
  depends_on "kconfig"
  depends_on "ki18n"

  def install
    args = std_cmake_args


    system "cmake", ".", "-DBUILD_TESTING=OFF", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
