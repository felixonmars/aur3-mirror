# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=man2web
pkgver=0.88
pkgrel=1
pkgdesc="Converts manual pages to html via CGI or on the command line"
arch=('i686' 'x86_64')
url="http://man2web.sourceforge.net/"
license=('custom')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0c07ffaf49b975c8adeae6cf8c975ee1')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
#license file
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
