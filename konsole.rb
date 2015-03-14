require "formula"

class Konsole < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/unstable/applications/14.11.97/src/konsole-14.11.97.tar.xz"
  sha1 "c07f4dae00b295e2c4fb81f782c2f0bc80add4d4"
  head "git://anongit.kde.org/konsole.git"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  depends_on "kdbusaddons"
  depends_on "kcoreaddons"
  depends_on "kconfig"
  depends_on "kcodecs"
  depends_on "ki18n"
  depends_on "kservice"
  depends_on "kwidgetsaddons"
  depends_on "kwindowsystem"
  depends_on "kcrash"
  depends_on "sonnet"
  depends_on "karchive"
  depends_on "kitemmodels"
  depends_on "kauth"
  depends_on "kguiaddons"
  depends_on "kconfigwidgets"
  depends_on "kitemviews"
  depends_on "knotifications"
  depends_on "kjs"
  depends_on "kpty"
  depends_on "kjobwidgets"
  depends_on "kiconthemes"
  depends_on "kcompletion"
  depends_on "ktextwidgets"
  depends_on "kglobalaccel"
  depends_on "attica"
  depends_on "kxmlgui"
  depends_on "solid"
  depends_on "kwallet"
  depends_on "kbookmarks"
  depends_on "kio"
  depends_on "kunitconversion"
  depends_on "knotifyconfig"
  depends_on "kparts"
  depends_on "kross"
  depends_on "kinit"
  depends_on "kdelibs4support"

  def patches
    DATA
  end

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"
    args << "-DCMAKE_INSTALL_BUNDLEDIR=/Applications/KDE"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end

__END__
diff --git a/CMakeLists.txt b/CMakeLists.txt
index a3d9a1c..793e586 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -41,6 +41,6 @@ include_directories(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR} ${KDE4_INCLUDES})
 add_subdirectory( src )
 add_subdirectory( data )
 add_subdirectory( desktop )
-add_subdirectory( doc/manual )
+#add_subdirectory( doc/manual )
 
 feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
