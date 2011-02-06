# $Id: PKGBUILD,v 1.15 2008/07/10 14:21:54 desaid Exp $
# Contributor: Drew "xaw" Desai <alerante@yahoo.com>
pkgname=roadsend-php
pkgver=2.9.6
pkgrel=1
pkgdesc="A free, open source implementation of the PHP language"
url="http://www.roadsend.com/home/index.php?pageID=compiler"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bigloo' 'gcc-libs')
optdepends=('mysql')
source=(http://code.roadsend.com/snaps/roadsend-php-${pkgver}.tar.bz2)
md5sums=(2322056edb57da8a01f8dae6a960ffef)
options=('!strip' '!makeflags' '!distcc' '!ccache')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

