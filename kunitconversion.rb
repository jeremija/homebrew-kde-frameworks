require "formula"

class Kunitconversion < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kunitconversion-5.8.0.tar.xz"
  sha1 "9eb97efe7f66a4b3555a83bbff4a625a58e47619"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kunitconversion.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "gettext" => :build
  depends_on "ki18n"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
