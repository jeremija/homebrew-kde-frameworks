require "formula"

class Kiconthemes < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kiconthemes-5.8.0.tar.xz"
  sha1 "44d720c39294ce6a12da73dd4acc0303fb420184"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kiconthemes.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kconfigwidgets"
  depends_on "kitemviews"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
