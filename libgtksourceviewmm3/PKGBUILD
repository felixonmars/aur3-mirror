# $Id: PKGBUILD 33294 2010-11-23 19:37:10Z heftig $
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=libgtksourceviewmm3
pkgver=3.2.0
pkgrel=1
pkgdesc='A C++ API for gtksourceview2'
arch=('i686' 'x86_64')
url='http://projects.gnome.org/gtksourceviewmm/'
license=('LGPL')
depends=('gtkmm3' 'gtksourceview3')
makedepends=('doxygen')
options=('!libtool' '!emptydirs')
source=("http://ftp.gnome.org/pub/GNOME/sources/gtksourceviewmm/3.2/gtksourceviewmm-$pkgver.tar.bz2")
md5sums=('edd7673937220ee441591a40f4fc96b0')

build() {
  cd gtksourceviewmm-${pkgver}

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd gtksourceviewmm-${pkgver}

  make DESTDIR=${pkgdir} install
}
