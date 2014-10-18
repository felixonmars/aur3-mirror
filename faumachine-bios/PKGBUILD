# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: kfgz <kfgz at interia dot pl>

pkgname=faumachine-bios
pkgver=20110816
pkgrel=2
pkgdesc="BIOS for faumachine"
arch=('i686' 'x86_64')
url="http://www3.informatik.uni-erlangen.de/Research/FAUmachine/"
license=('GPL')
source=(http://www3.informatik.uni-erlangen.de/Research/FAUmachine/bios/${pkgname}-${pkgver}.tar.gz)
md5sums=('4022432a020662be40b35710515e47f0')


build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
