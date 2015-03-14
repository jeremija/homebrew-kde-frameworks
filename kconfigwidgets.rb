require "formula"

class Kconfigwidgets < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kconfigwidgets-5.8.0.tar.xz"
  sha1 "4632522230ef115ba4871c37cf2e19241dcf979b"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kconfigwidgets.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kdoctools" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "kauth"
  depends_on "kcoreaddons"
  depends_on "kcodecs"
  depends_on "kconfig"
  depends_on "kguiaddons"
  depends_on "kwidgetsaddons"
  depends_on "ki18n"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
