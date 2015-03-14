require "formula"

class Kglobalaccel < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kglobalaccel-5.7.0.tar.xz"
  sha1 "5b13d4dd3dd2232fffe5d2dde0b7a19c42d48d66"
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
