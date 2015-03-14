require "formula"

class Okteta < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/unstable/applications/14.11.97/src/okteta-14.11.97.tar.xz"
  sha1 "e68a928c3f77942b1513ff322ebe6601685baaad"
  head "git://anongit.kde.org/okteta.git"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  depends_on "kbookmarks"
  depends_on "kcodecs"
  depends_on "kcompletion"
  depends_on "kconfigwidgets"
  depends_on "kdbusaddons"
  depends_on "kdoctools"
  depends_on "ki18n"
  depends_on "kcmutils"
  depends_on "kio"
  depends_on "knewstuff"
  depends_on "kparts"
  depends_on "kservice"
  depends_on "solid"
  depends_on "kwidgetsaddons"
  depends_on "kxmlgui"

  def patches
    DATA
  end

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end

__END__
diff --git a/CMakeLists.txt b/CMakeLists.txt
index e25a4b7..98258c0 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -91,7 +91,7 @@ add_definitions(
 
 # helper libs
 add_subdirectory( libs )
-add_subdirectory( doc )
+#add_subdirectory( doc )
 
 set( OKTETALIBS_MAJOR_VERSION 0 )
 set( OKTETALIBS_MINOR_VERSION 9 )
