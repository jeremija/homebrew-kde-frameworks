require "formula"

class Kf5Konsole < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/unstable/applications/14.11.97/src/konsole-14.11.97.tar.xz"
  sha1 "c07f4dae00b295e2c4fb81f782c2f0bc80add4d4"
  head "git://anongit.kde.org/konsole.git"

  depends_on "cmake" => :build
  depends_on "kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  depends_on "kf5-kdbusaddons"
  depends_on "kf5-kcoreaddons"
  depends_on "kf5-kconfig"
  depends_on "kf5-kcodecs"
  depends_on "kf5-ki18n"
  depends_on "kf5-kservice"
  depends_on "kf5-kwidgetsaddons"
  depends_on "kf5-kwindowsystem"
  depends_on "kf5-kcrash"
  depends_on "kf5-sonnet"
  depends_on "kf5-karchive"
  depends_on "kf5-kitemmodels"
  depends_on "kf5-kauth"
  depends_on "kf5-kguiaddons"
  depends_on "kf5-kconfigwidgets"
  depends_on "kf5-kitemviews"
  depends_on "kf5-knotifications"
  depends_on "kf5-kjs"
  depends_on "kf5-kpty"
  depends_on "kf5-kjobwidgets"
  depends_on "kf5-kiconthemes"
  depends_on "kf5-kcompletion"
  depends_on "kf5-ktextwidgets"
  depends_on "kf5-kglobalaccel"
  depends_on "kf5-attica"
  depends_on "kf5-kxmlgui"
  depends_on "kf5-solid"
  depends_on "kf5-kwallet"
  depends_on "kf5-kbookmarks"
  depends_on "kf5-kio"
  depends_on "kf5-kunitconversion"
  depends_on "kf5-knotifyconfig"
  depends_on "kf5-kparts"
  depends_on "kf5-kross"

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
