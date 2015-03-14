require "formula"

class Kf5Kcoreaddons < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kcoreaddons-5.8.0.tar.xz"
  sha1 "41aa49d1c6580e5d00818270e0272e2478d6e3b2"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kcoreaddons.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "shared-mime-info"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
