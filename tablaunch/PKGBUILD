# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Thereidos <admin@therek.net>
pkgname=tablaunch
pkgver=0.6
pkgrel=1
pkgdesc="Displays user-specified applications as tabs along the top of screen."
arch=('i686' 'x86_64')
license=('GPL-2')
depends=('imlib2')
url="http://tablaunch.sourceforge.net/"
source=(http://sourceforge.net/projects/tablaunch/files/tablaunch/0.6/tablaunch-0.6.tar.gz
        $pkgname-$pkgver.patch)
md5sums=('fe3d9349600a1e7b46a5bc1cd733f6d0' '4359144923c7ca156bef1fc52f91da72')

build() {
  cd $srcdir/$pkgname-$pkgver/src

  mkdir -p $pkgdir/usr/{bin,share/tablaunch}

  patch -N -i ../../$pkgname-$pkgver.patch
  make using.imlib2 || return 1

  install -m755 tablaunch $pkgdir/usr/bin
  install -m644 ../readme.html ../README $pkgdir/usr/share/tablaunch
}

# vim:set ts=2 sw=2 et:
