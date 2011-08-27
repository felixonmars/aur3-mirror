# Contributor: Vamp898 <vamp898@web.de>

pkgname=clutter-imcontext
pkgver=0.1.4
pkgrel=1
pkgdesc="Clutter"
arch=('i686' 'x86_64')
url="http://www.moblin.org/"
license=('LGPL')
depends=('clutter' 'cairo' 'glproto')
makedepends=( 'gtk-doc' )
source=( 'http://git.moblin.org/cgit.cgi/clutter-imcontext/snapshot/clutter-imcontext-0.1.4.tar.bz2' )
md5sums=('9f71a3cc9e73ea13888bfdb9bc4e8cf7')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
