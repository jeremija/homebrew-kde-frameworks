require "formula"

class Kservice < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kservice-5.7.0.tar.xz"
  sha1 "8c8c5b31c523bb2eddae5c6d4c014fac9e5948fb"
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
