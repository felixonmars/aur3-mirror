# Maintainer: corvolino <corvolinowins@gmail.com>

pkgname=pidgin-festival
pkgver=2.4
pkgrel=4
pkgdesc="Festival plugin for pidgin"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pidgin-festival/"
license=('GPL')
depends=('pidgin')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('bc96b1a729b1dae0159ef5d984d7d123')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}





