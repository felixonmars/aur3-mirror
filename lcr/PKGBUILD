# Maintainer: Lukas Martini <hello@lutoma.org>
pkgname=lcr
pkgver=1.7
pkgrel=1
_pkgts=20100601
pkgdesc="Linux-Call-Router is not only a router, it is a real ISDN PBX which interconnects ISDN telephones and ISDN lines."
url="http://isdn.eversberg.eu/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('misdnuser')
optdepends=()
makedepends=('linux-headers')
conflicts=()
replaces=()
backup=()
source=("http://isdn.eversberg.eu/download/${pkgname}-${pkgver}/${pkgname}-${_pkgts}.tar.gz")
md5sums=('68ccdcbe741df38c0f79d14c1b5473f5')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=4 sw=4 et:
