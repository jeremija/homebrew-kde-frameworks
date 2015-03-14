require "formula"

class Kdelibs4support < Formula
  url "http://download.kde.org/stable/frameworks/5.7/portingAids/kdelibs4support-5.7.0.tar.xz"
  sha1 "689d4f9d0c76e722b44c164dff608208333f1c51"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kdelibs4support.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kdoctools" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "kdesignerplugin"
  depends_on "kemoticons"
  depends_on "kinit"
  depends_on "kitemmodels"
  depends_on "kunitconversion"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
