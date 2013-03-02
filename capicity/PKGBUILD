# Maintainer: Zom <zom[at]eevul[dot]org>

pkgname=capicity
pkgver=1.0
pkgrel=1
pkgdesc="A client for playing monopoly, compatible to monopd and capid"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/Capicity?content=113173"
license=('GPL2')
depends=('qt4' 'libpng' 'libxext' 'openssl')
makedepends=()
source=(http://qt-apps.org/CONTENT/content-files/113173-CapiCity-${pkgver}.tar.gz
        'capicity.desktop')
md5sums=('6d86c418e828c54bad52baa079244451'
         'c551dde805c7fc7cc3fa8b87437f77e0')

build() {
  cd ${srcdir}/CapiCity-${pkgver}

  qmake-qt4 -makefile
  make
}

package() {
  cd ${srcdir}/CapiCity-${pkgver}

  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/icons/hicolor/{16x16,22x22,24x24,32x32,48x48,64x64}/apps
  install -d ${pkgdir}/usr/share/capicity/games

  install -m0755 CapiCity ${pkgdir}/usr/bin/capicity
  install -m0755 ../../capicity.desktop ${pkgdir}/usr/share/applications/
  install -m0644 icons/16x16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/capicity.png
  install -m0644 icons/22x22.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/capicity.png
  install -m0644 icons/24x24.png ${pkgdir}/usr/share/icons/hicolor/24x24/apps/capicity.png
  install -m0644 icons/32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/capicity.png
  install -m0644 icons/48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/capicity.png
  install -m0644 icons/64x64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/capicity.png

  # Does it even use these files? Better safe than sorry I guess.
  install -m0644 games/{atlantic.xml,city.xml} ${pkgdir}/usr/share/capicity/games/
  cp -r images ${pkgdir}/usr/share/capicity
  cp -r ts ${pkgdir}/usr/share/capicity
}
