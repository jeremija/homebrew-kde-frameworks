require "formula"

class Kjobwidgets < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kjobwidgets-5.7.0.tar.xz"
  sha1 "c140908d3ce484ea65b609245754fa46fc541d0d"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kjobwidgets.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kcoreaddons"
  depends_on "kwidgetsaddons"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
