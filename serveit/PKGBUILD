# Maintainer: Dan Serban
# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>

pkgname=serveit
pkgver=0.1
pkgrel=2
pkgdesc="HTTP server designed for transferring files on a LAN"
arch=(i686 x86_64)
url="http://code.google.com/p/serveit"
license=(GPLv3)
depends=(python2)
source=(http://serveit.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('590330cfd7efa704f23c25fb58727c32') 

build()
{
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/
}

# vim:set ts=2 sw=2 et:
