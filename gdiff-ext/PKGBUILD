# Maintainer: TDY <tdy@gmx.com>

pkgname=gdiff-ext
pkgver=0.3.2
pkgrel=1
pkgdesc="A Nautilus extension for launching file comparison tools"
arch=('i686' 'x86_64')
url="http://diff-ext.sourceforge.net/"
license=('BSD')
depends=('gnome-vfs' 'hicolor-icon-theme' 'nautilus>=2.14.0')
makedepends=('intltool' 'pkgconfig>=0.9.0')
options=('!libtool')
install=$pkgname.install
source=(http://downloads.sourceforge.net/${pkgname#g}/${pkgname#g}-$pkgver.tar.bz2
        $pkgname-$pkgver.diff)
md5sums=('2ceb3d9d766bce91c45eaffb06102c44'
         '8a8d8b2f60b55382d6bfba1ede661ec6')

build() {
  cd "$srcdir/${pkgname#g}-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff || return 1
  ./configure --prefix=/usr --disable-schemas-install
  make || return 1
}

package() {
  cd "$srcdir/${pkgname#g}-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
