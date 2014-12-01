# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pypty
pkgver=1.01
pkgrel=2
pkgdesc="A reimplementation of 'script' with a little more functionality thrown in"
arch=('any')
url="http://stromberg.dnsalias.org/~dstromberg/pypty/"
license=('GPL3')
depends=('ncurses')
source=(http://stromberg.dnsalias.org/~dstromberg/$pkgname/$pkgname.tar.gz)
md5sums=('b6193f976e309568d70d1153c5655e5d')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $pkgname script-replay

  install -D -m755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -D -m755 script-replay "${pkgdir}"/usr/bin/script-replay
}
