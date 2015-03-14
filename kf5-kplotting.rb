require "formula"

class Kf5Kplotting < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kplotting-5.7.0.tar.xz"
  sha1 "e402ae82a3f31d4584635c71b624f4a8706f40ab"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kplotting.git'

  depends_on "cmake" => :build
  depends_on "kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
