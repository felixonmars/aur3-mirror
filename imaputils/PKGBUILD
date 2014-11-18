# Maintainer: 3m0
pkgname=imaputils
pkgver=1.0.3
pkgrel=1
pkgdesc="A number of tools and scripts for use with IMAP servers (Rick Sanders' imaptools fork)."
url="https://code.google.com/p/imaputils/"
arch=('x86_64' 'i686')
license=('Other')
depends=('perl>=5.8')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='imaputils.install'
source=("http://tsatsenko.ru/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('423ae2f9fe7f02d82333cffd10fb0871')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  perl Makefile.PL
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
