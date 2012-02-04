# Contributor: Snorre Jensen snojen@gmail.com

pkgname=xmms-bs2b
pkgver=0.5.0
pkgrel=1
pkgdesc="Bauer stereophonic-to-binaural plugin"
arch=(i686 x86_64)
url="http://bs2b.sourceforge.net/"
license=('GPL')
depends=('xmms')
groups=('xmms-plugins' 'xmms-io-plugins')
makedepends=(gtk libbs2b)

source=(http://downloads.sourceforge.net/bs2b/${pkgname}-${pkgver}.tar.gz)
md5sums=('ecc8c55247364fc584c823d2f218c21a')

build() {
   cd ${startdir}/src/${pkgname}-${pkgver}
   ./configure
   make || return 1
   make DESTDIR=${startdir}/pkg install || return 1
}
