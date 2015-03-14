require "formula"

class Kjsembed < Formula
  url "http://download.kde.org/stable/frameworks/5.7/portingAids/kjsembed-5.7.0.tar.xz"
  sha1 "bc34a4bb094a43880edba92e6b870580e545714b"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/attica.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kdoctools" => :build
  depends_on "ki18n"
  depends_on "kjs"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args
    args << "-DCMAKE_PREFIX_PATH=/usr/local/opt/gettext"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
