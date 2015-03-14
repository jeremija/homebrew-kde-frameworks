require "formula"

class Kmediaplayer < Formula
  url "http://download.kde.org/stable/frameworks/5.7/portingAids/kmediaplayer-5.7.0.tar.xz"
  sha1 "692caf43315a7072807210eeaaf218af5358ea54"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/attica.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kparts"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
