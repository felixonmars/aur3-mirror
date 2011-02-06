# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Nathan Owe ndowens04 at gmail dot com
# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=cronolog
pkgver=1.6.2
pkgrel=4
pkgdesc="Web log rotation utility"
arch=('i686' 'x86_64')
url="http://cronolog.org"
license=("GPL")
depends=('glibc')
source=(http://cronolog.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('a44564fd5a5b061a5691b9a837d04979')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}


