require "formula"

class Ktextwidgets < Formula
  url "http://download.kde.org/stable/frameworks/5.8/ktextwidgets-5.8.0.tar.xz"
  sha1 "e05b62d147cea1a40a2d624b41fdc4d8466d79e1"
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
