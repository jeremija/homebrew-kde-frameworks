require "formula"

class Ktextwidgets < Formula
  url "http://download.kde.org/stable/frameworks/5.7/ktextwidgets-5.7.0.tar.xz"
  sha1 "50b532877ec7fefd8962576eb58390815337321f"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/ktextwidgets.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kcompletion"
  depends_on "kiconthemes"
  depends_on "kservice"
  depends_on "sonnet"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end