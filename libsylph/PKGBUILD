# Contributor: Simon Lackerbauer <calypso@nopm.net>
pkgname=libsylph
pkgver=1.1.0
pkgrel=2
pkgdesc="A lib providing core features of the mailer Sylpheed UI-independent"
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
license=("LGPL")
source=(http://sylpheed.sraoss.jp/sylpheed/libsylph/$pkgname-$pkgver.tar.bz2)
md5sums=('60c7773b6e84cd5f9fbf417e168cea1e')
sha1sums=('ab33bdcf3bfdb157802649e49d007fd24d3edadf')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
