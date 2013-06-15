# Maintainer: Marc Coiffier <marc.coiffier@gmail.com>
pkgname=omget
pkgver=1.0
pkgrel=2
pkgdesc="A simple manga downloading utility."
url="http://packages.alpha-lang.net/$pkgname-$pkgver/"
license=('BSD')
arch=('x86_64')
_arsrc=$pkgname-$pkgver.tgz
source=($_arsrc::http://packages.alpha-lang.net/$pkgname-$pkgver/source.tgz)

package() {
  cd "$pkgdir"
  tar -xzf "$srcdir/$_arsrc"
}

md5sums=('95037c362393abc1e7027387343913d5')
