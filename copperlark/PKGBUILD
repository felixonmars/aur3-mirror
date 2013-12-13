# Maintainer: der_FeniX <derfenix@gmail.com>
# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributors by way of bitcoin* packages in arch repos
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: shahid <helllamer@gmail.com>

pkgname=copperlark
pkgver=0.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://copperlark.com/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
source=('CopperLarkSrc.zip::https://copperlark.com/wp-download.php?file=CopperLarkSrc.zip'
	'copperlark.install'
	'copperlark.desktop')
sha256sums=('05a7cea0f84d2da2015ff3684c82c47caf1890ead5be26c8c72bc302df4552e9'
	    'ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c'
	    'a8c2ae29cb33573593037c6dab3bd3ae7cba07c38454fc0392ccfde4fc509c3e')
pkgdesc="Copper Lark is a peer-to-peer network based digital currency"
depends=(boost-libs qt4 miniupnpc qrencode)
install=copperlark.install

build() {
  cd "${srcdir}/CopperLarkSrc"
  # at 2013-12-07 there is *.o files in archive
  find . -type f -name '*\.o' -exec rm {} + 

  qmake-qt4 USE_QRCODE=1
  make
}


package() {
  install -Dm644 "${srcdir}/copperlark.desktop" \
    "${pkgdir}/usr/share/applications/copperlark.desktop"
  cd "${srcdir}/CopperLarkSrc"
  install -Dm755 CopperLark "${pkgdir}/usr/bin/copperlark"
  install -Dm644 "src/qt/res/icons/bitcoin.png" \
    "${pkgdir}/usr/share/pixmaps/copperlark.png"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
