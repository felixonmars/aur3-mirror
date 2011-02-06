# Contributor: David Gidwani <miniature@archlinux.us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: John Gerritse <reaphsharc@gmail.com>

pkgname=xqde
pkgver=20090301
pkgrel=2
pkgdesc="A docker application that provides functionality similar to KXDocker in many ways. It works together with a compositing window manager."
url="http://sourceforge.net/projects/xqde"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt' 'libxcomposite')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('11d81d75536f272b8367db1ebb43a507')

build() {
cd $srcdir/$pkgname-$pkgver

# install -d $pkgdir/usr/share/xqde
qmake || return 1
make || return 1
install -D -m755 libxqdebase $pkgdir/usr/bin/xqde
# cp * $pkgdir/usr/share/xqde || return 1 
}
