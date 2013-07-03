# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: pumbur

pkgname=eatmonkey
pkgver=0.1.4
pkgrel=2
pkgdesc="Download manager for Xfce that works with aria2"
arch=(any)
url="http://goodies.xfce.org/projects/applications/eatmonkey"
license=(custom)
depends=(gtk2 libnotify ruby aria2 ruby-gtk2)
install=eatmonkey.install
source=(http://archive.xfce.org/src/apps/eatmonkey/0.1/eatmonkey-$pkgver.tar.bz2)
md5sums=(7728946a5e65d709302102cb505a1ace)

package() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
  (
    echo '#!/bin/sh'
    echo 'cd /usr/share/eatmonkey && exec ruby -I"/usr/share/eatmonkey" eat.rb "$@"'
  ) > $pkgdir/usr/bin/eatmonkey
}

