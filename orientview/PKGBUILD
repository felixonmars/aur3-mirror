# Maintainer: Mikko Ronkainen <firstname@mikkoronkainen.com>

pkgname=orientview
pkgver=1.0.0
pkgrel=3
pkgdesc="Orienteering video and map analysis"
arch=("i686" "x86_64")
url="https://github.com/mikoro/orientview"
license=("GPL3")
depends=("qt5-base" "qt5-imageformats" "qt5-svg" "ffmpeg" "opencv" "x264" "libx264" "l-smash-git")
provides=("orientview")
conflicts=("orientview")

source=("https://github.com/mikoro/orientview/archive/v${pkgver}.tar.gz")
md5sums=("SKIP")

build() {
  cd orientview-${pkgver}
  
  qmake PREFIX=${pkgdir}
  make
}

package() {
  cd orientview-${pkgver}
  
  make install
  
  cd ${pkgdir}
  
  mkdir -p usr/bin
  mkdir -p usr/share/applications
  mkdir -p usr/share/icons/hicolor/{16x16,24x24,32x32,48x48,64x64,128x128,256x256,scalable}/apps
  
  ln -s /opt/orientview/orientview usr/bin/orientview
  
  cp ${srcdir}/orientview-${pkgver}/misc/linux/orientview.desktop usr/share/applications
  
  cp ${srcdir}/orientview-${pkgver}/misc/icons/orientview-16x16.png usr/share/icons/hicolor/16x16/apps/orientview.png
  cp ${srcdir}/orientview-${pkgver}/misc/icons/orientview-24x24.png usr/share/icons/hicolor/24x24/apps/orientview.png
  cp ${srcdir}/orientview-${pkgver}/misc/icons/orientview-32x32.png usr/share/icons/hicolor/32x32/apps/orientview.png
  cp ${srcdir}/orientview-${pkgver}/misc/icons/orientview-48x48.png usr/share/icons/hicolor/48x48/apps/orientview.png
  cp ${srcdir}/orientview-${pkgver}/misc/icons/orientview-64x64.png usr/share/icons/hicolor/64x64/apps/orientview.png
  cp ${srcdir}/orientview-${pkgver}/misc/icons/orientview-128x128.png usr/share/icons/hicolor/128x128/apps/orientview.png
  cp ${srcdir}/orientview-${pkgver}/misc/icons/orientview-256x256.png usr/share/icons/hicolor/256x256/apps/orientview.png
  cp ${srcdir}/orientview-${pkgver}/misc/icons/orientview.svg usr/share/icons/hicolor/scalable/apps
}
