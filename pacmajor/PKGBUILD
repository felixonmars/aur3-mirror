# Maintainer: Paul Colomiets <pc@gafol.net>
pkgname=pacmajor
pkgver=0.1.2
pkgrel=1
pkgdesc="Package manager (pacman frontend)"
arch=('any')
url="http://github.com/tailhook/pacmajor"
license=('MIT')
depends=('python-archive')
backup=('etc/pacmajor.conf')
source=(https://github.com/downloads/tailhook/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4314a4bda00c8f736ba344d1a3fce29d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
  install -D pacmajor.conf $pkgdir/etc/pacmajor.conf
}

# vim:set ts=2 sw=2 et:
