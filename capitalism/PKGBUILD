# Maintainer: Zom <zom[at]eevul[dot]org>

pkgname=capitalism
pkgver=0.5.1
pkgrel=1
pkgdesc="A client for playing monopoly, compatible to monopd and capid"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/Capitalism?content=113173"
license=('GPL2')
depends=('qt' 'libpng' 'libxext' 'openssl')
makedepends=()
source=(http://qt-apps.org/CONTENT/content-files/113173-capitalism_${pkgver}.tbz
        'capitalism.desktop')
md5sums=('fb510cf0a1f18d757f87422d559b2f4a'
         'c551dde805c7fc7cc3fa8b87437f77e0')

build() {
  cd ${srcdir}/Capitalism_${pkgver}

  qmake -makefile
  make
}

package() {
  cd ${srcdir}/Capitalism_${pkgver}

  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/icons/hicolor/{16x16,22x22,24x24,32x32,48x48,64x64}/apps
  install -d ${pkgdir}/usr/share/capitalism/games

  install -m0755 Capitalism ${pkgdir}/usr/bin/capitalism
  install -m0755 ../../capitalism.desktop ${pkgdir}/usr/share/applications/
  install -m0644 icons/16x16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/capitalism.png
  install -m0644 icons/22x22.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/capitalism.png
  install -m0644 icons/24x24.png ${pkgdir}/usr/share/icons/hicolor/24x24/apps/capitalism.png
  install -m0644 icons/32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/capitalism.png
  install -m0644 icons/48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/capitalism.png
  install -m0644 icons/64x64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/capitalism.png

  # Does it even use these files? Better safe than sorry I guess.
  install -m0644 games/{atlantic.xml,city.xml,MyMonopoly.xml} ${pkgdir}/usr/share/capitalism/games/
  cp -r images ${pkgdir}/usr/share/capitalism
  cp -r ts ${pkgdir}/usr/share/capitalism
}
