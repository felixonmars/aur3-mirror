# Maintainer: Michael Reim <kraileth@elderlinux.org>

pkgname=netrider
pkgver=0.94
pkgrel=1
pkgdesc='A webkit based internet browser using the FLTK toolkit'
arch=('x86_64' 'i686')
license=('BSD')
url='http://sourceforge.net/projects/netrider'
depends=('icu' 'libxml2' 'libxslt' 'libx11' 'libjpeg-turbo' 'libpng' 'sqlite3' 'openssl' 'curl' 'freetype2' 'fltk')
makedepends=('perl-switch' 'cmake' 'flex' 'cpanminus' 'python2' 'bison27' 'glew' 'gsasl' 'c-ares' 'gperf')
source=("http://downloads.sourceforge.net/project/netrider/${pkgname}094_src.tar.gz"
        "netrider_48x48.png"
        "netrider_256x256.png")
md5sums=('bdd979f76f7a99720ce9fac856c27621'
         '4ff129b3a1b935e70447541b28d26c6e'
         '93a2e408d97dffb7751c6384284bc6de')

build() {
  cd "${pkgname}094_src/Source/ThirdParty/skia"
  make clean
  make
  cd ../../../WebKitBuild
  sed -i -e '7d' -e '9d' -e '15d' -e '16d'  ../Source/CMakeLists.txt
  cmake -DPORT=WKCCC -DCMAKE_BUILD_TYPE=release ../Source
  make
}

package() {
  cd "${pkgname}094_src/WebKitBuild"
  mkdir -p ${pkgdir}/usr/{bin,lib,share/{applications,pixmaps}}
  cp WebKit/libwebkit_wkccc.so.0.1.0 ${pkgdir}/usr/lib
  ln -s /usr/lib/libwebkit_wkccc.so.0.1.0 ${pkgdir}/usr/lib/libwebkit_wkccc.so.0
  ln -s /usr/lib/libwebkit_wkccc.so.0.1.0 ${pkgdir}/usr/lib/libwebkit_wkccc.so
  cp Programs/netrider ${pkgdir}/usr/bin
  cp "${srcdir}/netrider_48x48.png" ${pkgdir}/usr/share/pixmaps
  cp "${srcdir}/netrider_256x256.png" ${pkgdir}/usr/share/pixmaps
  echo "[Desktop Entry]" > ${pkgdir}/usr/share/applications/NetRider.desktop
  echo "Type=Application" >> ${pkgdir}/usr/share/applications/NetRider.desktop
  echo "Version=${pkgver}" >> ${pkgdir}/usr/share/applications/NetRider.desktop
  echo "Name=NetRider" >> ${pkgdir}/usr/share/applications/NetRider.desktop
  echo "Exec=netrider" >> ${pkgdir}/usr/share/applications/NetRider.desktop
  echo "Icon=netrider_48x48" >> ${pkgdir}/usr/share/applications/NetRider.desktop
  echo "Terminal=false" >> ${pkgdir}/usr/share/applications/NetRider.desktop
  echo "Categories=Network" >> ${pkgdir}/usr/share/applications/NetRider.desktop
}
