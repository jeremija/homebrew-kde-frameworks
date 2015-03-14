require "formula"

class Kjsembed < Formula
  url "http://download.kde.org/stable/frameworks/5.8/portingAids/kjsembed-5.8.0.tar.xz"
  sha1 "eb5b72edb4348d12b94c08e7d60c44604ae49780"
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
