require "formula"

class Ktexteditor < Formula
  url "http://download.kde.org/stable/frameworks/5.7/ktexteditor-5.7.0.tar.xz"
  sha1 "44c63e326e906761c646732fbe3e9757acefbf8f"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/ktexteditor.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "kparts"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
