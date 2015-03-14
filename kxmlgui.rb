require "formula"

class Kxmlgui < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kxmlgui-5.8.0.tar.xz"
  sha1 "a4368e07119e498cba24c4a999b35443982490c9"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kxmlgui.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kglobalaccel"
  depends_on "ktextwidgets"
  depends_on "attica"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
