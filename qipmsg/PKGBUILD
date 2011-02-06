# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=qipmsg
pkgver=1.0.0
pkgrel=2
pkgdesc="is an IP Messenger implementaion for linux. "
arch=('i686' 'x86_64')
url="http://code.google.com/p/qipmsg/"
license=('GPL')
depends=('qt')
source=(http://qipmsg.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('6996bb789bea9c42b74c9d720c86bcfa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make QMAKE=/usr/bin/qmake LRELEASE=/usr/bin/lrelease PREFIX=/usr || return 1

}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir/" install
}



