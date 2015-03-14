require "formula"

class Kitemmodels < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kitemmodels-5.8.0.tar.xz"
  sha1 "e65692e84ee86a369888403431e2d489add858e6"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kitemmodels.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
