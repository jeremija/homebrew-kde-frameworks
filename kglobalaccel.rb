require "formula"

class Kglobalaccel < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kglobalaccel-5.8.0.tar.xz"
  sha1 "95d285e1d7f36f006c082af0a0a8239019876670"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kglobalaccel.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kcoreaddons"
  depends_on "kcrash"
  depends_on "kdbusaddons"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
