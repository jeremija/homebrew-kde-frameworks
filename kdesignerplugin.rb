require "formula"

class Kdesignerplugin < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kdesignerplugin-5.7.0.tar.xz"
  sha1 "af7203acced37c08de79e196632c83fc67c68d14"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kdesignerplugin.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kdoctools" => :build
  depends_on "kdewebkit"
  depends_on "kplotting"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
