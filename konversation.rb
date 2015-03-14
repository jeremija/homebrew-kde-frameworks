require "formula"

class Konversation < Formula
  homepage "http://www.kde.org/"

  url "http://download.kde.org/unstable/konversation/1.6-beta1/src/konversation-1.6-beta1.tar.xz"
  sha1 "564bdc092cbdce1c0a9cf1e5362d4956c059c6f3"
  head "git://anongit.kde.org/konversation.git", :branch => "master"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "qca" => :optional # must built with qt5

  depends_on "karchive"
  depends_on "kbookmarks"
  depends_on "kconfig"
  depends_on "kconfigwidgets"
  depends_on "kdoctools"
  depends_on "kemoticons"
  depends_on "ki18n"
  depends_on "kidletime"
  depends_on "knotifyconfig"
  depends_on "kdelibs4support"
  depends_on "kio"
  depends_on "kparts"
  depends_on "solid"
  depends_on "sonnet"
  depends_on "kwallet"
  depends_on "kwidgetsaddons"
  depends_on "kglobalaccel"

 # def patches
 #   DATA
 # end

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
