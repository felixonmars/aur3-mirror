# Contributor: Simon Copar <info.ised@gmail.com>
pkgname=wingedmonkey
pkgver=0.2.4
pkgrel=1
pkgdesc="lightweight nonreparenting window manager for X"
arch=('i686' 'x86_64')
url="http://wingedmonkey.sourceforge.net"
license=('GPL3')
depends=('libx11' 'xproto')
optdepends=('xbindkeys' 'rxvt-unicode' 'lxpanel' 'wxpython')
makedepends=('libx11' 'xproto')
source=(http://downloads.sourceforge.net/project/wingedmonkey/$pkgname-$pkgver.tar.bz2)
md5sums=('a9f9c4893647f007eaecc8543bbf0f0c')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
