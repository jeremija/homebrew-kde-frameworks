require "formula"

class Kbookmarks < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kbookmarks-5.8.0.tar.xz"
  sha1 "b893da19487320f1a5649ac2d671b366393ea3b0"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kbookmarks.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kxmlgui"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
