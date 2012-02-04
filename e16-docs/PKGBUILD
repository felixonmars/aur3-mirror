# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=e16-docs
pkgver=0.16.8.0.2
pkgrel=1
pkgdesc="Enlightenment DR16 documentation"
arch=('i686' 'x86_64')
url="http://enlightenment.org/"
license=('MIT')
depends=('enlightenment>=0.16.8')
source=(http://downloads.sourceforge.net/sourceforge/enlightenment/$pkgname-$pkgver.tar.gz)
md5sums=('46bcdcc5cdad76159923671cfcea93f9')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir"/$pkgname-$pkgver  

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
