require "formula"

class Kate < Formula
  url "http://download.kde.org/stable/applications/14.12.2/src/kate-14.12.2.tar.xz"
  sha1 "bc3a5b1213fbe96756261daadf9ff8f94e74fd9c"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kate.git"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  depends_on "kconfig"
  depends_on "kdoctools"
  depends_on "kguiaddons"
  depends_on "ki18n"
  depends_on "kinit"
  depends_on "kjobwidgets"
  depends_on "kio"
  depends_on "kparts"
  depends_on "ktexteditor"
  depends_on "kwindowsystem"
  depends_on "kxmlgui"
  depends_on "kitemmodels"
  depends_on "knewstuff"
  depends_on "kwallet"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
