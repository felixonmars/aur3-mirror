# Maintainer: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>
# Contributor: Richard Jackson <rdjack21 at gmail dot com>
# Contributor: Tinx <arch at tinx dot eu>
# Contributor: Jens Kapitza <j dot kapitza at schwarze-allianz dot de>
# Contributor: Olli <olli at coderkun dot de>

pkgname=('openjfx' 'openjfx-doc' 'openjfx-src')
pkgver='8u45_b13'
pkgrel=1
pkgdesc='OpenJFX 8 libraries (open-source implementation of JavaFX)'
arch=('i686' 'x86_64')
url='https://wiki.openjdk.java.net/display/OpenJFX/Main'
license=('GPL')
depends=('java-runtime-openjdk=8' 'gstreamer' 'libxtst' 'webkitgtk2' 'ffmpeg'
         'qt5-base')
makedepends=('java-environment-openjdk=8' 'mercurial' 'gradle-1.8' 'bison'
             'gperf' 'qtchooser' 'gtk2' 'libxtst' 'ffmpeg' 'python' 'qt5-base'
             'webkitgtk2')
source=('openjfx::hg+http://hg.openjdk.java.net/openjfx/8u-dev/rt#tag=8u45-b13'
        'gradle.properties'
        'build_gradle.patch')
sha256sums=('SKIP'
            '1d09385ac23d755aec079954247365de3875507641f5ecd7bd3511ebf3fa9e3c'
            '6121ac6385ebb130fbc8d652613d1b9663acf7b4c0eb0c15652988a7338d3b79')

prepare() {
  # Apply patches
  cd "${srcdir}/${pkgname}"
  patch -p1 < "${srcdir}/build_gradle.patch"
}

build() {
  # Links the properties file
  ln -sf "${srcdir}/gradle.properties" "${srcdir}/${pkgname}"

  # Build openjfx
  cd "$srcdir/$pkgname"
  gradle-1.8
}

package_openjfx() {
  local openjdk8dir="usr/lib/jvm/java-8-openjdk"
  local builddir="${srcdir}/${pkgname}/build"
  local sdkdir="${builddir}/sdk"

  if [[ $CARCH = "i686" ]]; then
    install -d "${pkgdir}/${openjdk8dir}/jre/lib/i386"
  else
    install -d "${pkgdir}/${openjdk8dir}/jre/lib/amd64"
  fi
  install -d "${pkgdir}/${openjdk8dir}/jre/lib/ext"
  install -d "${pkgdir}/${openjdk8dir}/lib"
  install -d "${pkgdir}/${openjdk8dir}/bin"
  install -d "${pkgdir}/${openjdk8dir}/man/man1"
  
  if [[ $CARCH = "i686" ]]; then
    install -m755 "${sdkdir}/rt/lib/i386"/*.* "${pkgdir}/${openjdk8dir}/jre/lib/i386"
  else
    install -m755 "${sdkdir}/rt/lib/amd64"/*.* "${pkgdir}/${openjdk8dir}/jre/lib/amd64"
  fi
  install -m644 "${sdkdir}/rt/lib/ext"/*.* "${pkgdir}/${openjdk8dir}/jre/lib/ext"
  install -m644 "${sdkdir}/rt/lib"/*.* "${pkgdir}/${openjdk8dir}/jre/lib"
  install -m644 "${sdkdir}/lib"/*.* "${pkgdir}/${openjdk8dir}/lib"
  install -m755 "${sdkdir}/bin"/* "${pkgdir}/${openjdk8dir}/bin"
  install -m644 "${sdkdir}/man/man1/javapackager.1" "${pkgdir}/${openjdk8dir}/man/man1"
}

package_openjfx-doc() {
  local docdir="usr/share/doc"
  local builddir="${srcdir}/openjfx/build"

  pkgdesc="OpenJFX 8 documentation (open-source implementation of JavaFX)"

  install -d "${pkgdir}/${docdir}/openjfx"
  cp -dr --no-preserve=ownership "${builddir}/javadoc"/* "${pkgdir}/${docdir}/openjfx"
}

package_openjfx-src() {
  local openjdk8dir="usr/lib/jvm/java-8-openjdk"
  local builddir="${srcdir}/openjfx/build"

  pkgdesc="OpenJFX 8 sources (open-source implementation of JavaFX)"
  install -d "${pkgdir}/${openjdk8dir}"
  install -m644 "${builddir}/javafx-src.zip" "${pkgdir}/${openjdk8dir}"
}

