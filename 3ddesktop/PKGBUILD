# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=3ddesktop
pkgver=0.2.9
pkgrel=4
pkgdesc="a 3d virtual desktop switcher (opengl/mesa)"
arch=('i686' 'x86_64')
url="http://desk3d.sourceforge.net"
license=('GPL')
depends=('libxmu' 'imlib2' 'freeglut' 'glu')
backup=('etc/3ddesktop.conf')
source=("http://downloads.sourceforge.net/sourceforge/desk3d/$pkgname-$pkgver.tar.gz"
        "3ddesktop-0.2.9-gcc4.patch"
        "3ddesktop-0.2.9-missing-include.patch")
md5sums=('da1e8b0d2c210a441676bbf663e694ee'
         '9aac53edbd737f827651470da4e5a7b2'
         'ae911ed543329f63fe50cfbb9021deeb')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -Np1 < ../3ddesktop-0.2.9-gcc4.patch
  patch -Np1 < ../3ddesktop-0.2.9-missing-include.patch

  autoreconf -fi
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
