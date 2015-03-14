require "formula"

class Kactivities < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kactivities-5.7.0.tar.xz"
  sha1 "f2e2f3d70bfc7cf95701b5b55036ca2ac9a2c52b"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kactivities.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "kdeclarative"
  depends_on "kdbusaddons"
  depends_on "ki18n"
  depends_on "kcmutils"
  depends_on "boost"

  def install
    args = std_cmake_args
    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"
    args << "-DCMAKE_C_FLAGS='-D_DARWIN_C_SOURCE'"
    args << "-DCMAKE_REQUIRED_DEFINITIONS='-D_DARWIN_C_SOURCE'"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
