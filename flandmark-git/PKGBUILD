# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=flandmark-git
pkgver=1.07.r44.gaa3110d
pkgrel=1
pkgdesc="An open source C library implementing a facial landmark detector in static images"
arch=("i686" "x86_64")
url="http://cmp.felk.cvut.cz/~uricamic/flandmark/"
license=("GPL3")
depends=("opencv")
makedepends=("git")
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/uricamic/${pkgname/-/.}"
        "0001-CMake-Build-Fixes.patch"
        "0001-CMake-change-variables-shown-in-configuration-GUI.patch"
        "0001-Avoid-conflict-between-shared-static-libs-in-MSVC.patch"
        "0002-Add-a-CMake-find-module-for-flandmark.patch"
        "0001-Simplify-flandmarkConfig.cmake.in.patch"
        "0002-Update-example-external-CMakeLists.txt.patch"
        "0001-Require-CMake-2.8-to-avoid-CMP0012-warnings.patch")
sha256sums=("SKIP"
            "dcea32f4030b87e37a815ffbea52b023306776a79a1f96e01771c6137b341f06"
            "f2dcf350f58629f84e4c59d5aa63b7aa30838f893291ab9f34acb67e6ae1944d"
            "c5b97f55e086b6b8b205ed32aa08d1901b8a60a3dc0bf2fafe9c7849dd6bce6a"
            "2ceacf229b9541081a84eb09a7444255246d9cc7a44d05a7f77b98a83afef8a7"
            "fe44715aedf67f404c6a1b06090077fc0eb27b397c75f0ddd979475e4182b6b1"
            "35d73633fe0d14bc96ec56f323cdd1ba2afd7e721660d8fa78c118a82c149023"
            "2d7d57887f120d9b712925f11c1d72a9565d39259328c6f5f4d2d6622879b251")

pkgver() {
  cd "${srcdir}/${pkgname}"

  local version_release version_vcs

  version_release="$( perl -e '
    open(my $fh, "<", "CMakeLists.txt");
    for my $identifier ("MAJOR", "MINOR"){
        while (<$fh>) {
            $version .= sprintf(".%.2d", "$1") if (/VERSION_$identifier\s+(\d+)/);
        }
        seek($fh, 0, 0);
    }
    print($version =~ s/^[.0]*//r);
    ' )"
  version_vcs="$( printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )"

  printf "%s.%s" "$version_release" "$version_vcs"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -p1 -i "${srcdir}/0001-CMake-Build-Fixes.patch"
  patch -p1 -i "${srcdir}/0001-CMake-change-variables-shown-in-configuration-GUI.patch"
  patch -p1 -i "${srcdir}/0001-Avoid-conflict-between-shared-static-libs-in-MSVC.patch"
  patch -p1 -i "${srcdir}/0002-Add-a-CMake-find-module-for-flandmark.patch"
  patch -p1 -i "${srcdir}/0001-Simplify-flandmarkConfig.cmake.in.patch"
  patch -p1 -i "${srcdir}/0002-Update-example-external-CMakeLists.txt.patch"
  patch -p1 -i "${srcdir}/0001-Require-CMake-2.8-to-avoid-CMP0012-warnings.patch"

  sed -i "s|haarcascade_frontalface_alt.xml|/usr/share/opencv/haarcascades/&|" examples/example?.cpp
  sed -i "\|flandmark_init| s|flandmark_model.dat|/usr/share/${pkgname%-git}/data/&|" examples/*example*cpp
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DBUILD_CPP_EXAMPLES="ON" \
    -DBUILD_MATLAB_BINDINGS="OFF" \
    -DBUILD_SHARED_LIBS="TRUE" \
    -DCMAKE_SKIP_BUILD_RPATH="TRUE"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  # library
  install -m755 -d "${pkgdir}/usr/lib"
  cp --no-dereference --preserve=mode libflandmark/*.so* "${pkgdir}/usr/lib"

  # header
  install -m755 -d "${pkgdir}/usr/include"
  install -m644 -t "${pkgdir}/usr/include" libflandmark/flandmark_detector.h

  # binaries
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin" examples/flandmark_{1,2,simple_example}

  # data
  install -m755 -d "${pkgdir}/usr/share/${pkgname%-git}/data"
  install -m644 -t "${pkgdir}/usr/share/${pkgname%-git}/data" examples/*.dat

  # samples: test data and source code
  install -m755 -d "${pkgdir}/usr/share/${pkgname%-git}/examples"
  install -m644 -t "${pkgdir}/usr/share/${pkgname%-git}/examples" examples/*.{jpg,avi,cpp}

  # cmake files
  perl -pi -e 's|FLANDMARK_INCLUDE_DIRS\s*"\K[^"]*|/usr/include|' libflandmark/flandmarkConfig.cmake
  perl -pi -e 's|FLANDMARK_LIBRARIES\s*"\K[^"]*/|/usr/lib/|' libflandmark/flandmarkConfig.cmake
  install -m755 -d "${pkgdir}/usr/share/${pkgname%-git}/cmake"
  install -m644 -t "${pkgdir}/usr/share/${pkgname%-git}/cmake" libflandmark/{FindFLANDMARK,flandmarkConfig}.cmake

  # publication information
  install -m755 -d "${pkgdir}/usr/share/${pkgname%-git}"
  install -m644 -t "${pkgdir}/usr/share/${pkgname%-git}" README
}

# vim:set ts=2 sw=2 et: 
