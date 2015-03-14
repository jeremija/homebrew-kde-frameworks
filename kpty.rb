require "formula"

class Kpty < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kpty-5.7.0.tar.xz"
  sha1 "1078f0ac72b95d517dd19338b670013df043ee3d"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kpty.git'

  depends_on "cmake" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "gettext" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kcoreaddons" => :build
  depends_on "kjs" => :build
  depends_on "ki18n" => :build

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
