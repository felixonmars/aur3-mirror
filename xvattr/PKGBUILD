# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: eric <eric@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=xvattr
pkgver=1.3
pkgrel=4
pkgdesc="Adjust attributes associated with the Xv extension to XFree86"
arch=('i686' 'x86_64')
url="http://www.dtek.chalmers.se/~dvd/"
license=('GPL')
depends=('libxv')
optdepends=('gxvattr: gtk interface')
makedepends=('libsm')
source=("ftp://ftp.eenet.ee/pub/FreeBSD/distfiles/xvattr-1.3.tar.gz"
#source=("ftp://ftp.li.kernel.org/pub/.6/gentoo/distfiles/xvattr-1.3.tar.gz")
#source=("http://www.dtek.chalmers.se/~dvd/dist/${pkgname}-${pkgver}.tar.gz") --> Gone
        "$pkgname-$pkgver-nogtk.patch")
md5sums=('041e0d1f2ebce216e69e08ce78ec2ceb'
         'a47ed878903f3e104b3ca10fdf2434d4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # disabling gtk interface
  patch -p1 -i ../$pkgname-$pkgver-nogtk.patch

  autoreconf
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --without-gtk
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
