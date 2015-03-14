require "formula"

class Kdesignerplugin < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kdesignerplugin-5.8.0.tar.xz"
  sha1 "00a9b826d8d3a7eb39bb018a2783cb32e569fa57"
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
