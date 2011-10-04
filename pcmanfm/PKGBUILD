# $Id: PKGBUILD 49034 2011-06-09 21:26:14Z andrea $
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>

pkgname=pcmanfm
pkgver=0.9.9
pkgrel=1
pkgdesc="File manager of the LXDE Desktop"
arch=('i686' 'x86_64')
url="http://pcmanfm.sourceforge.net/"
license=('GPL')
groups=('lxde')
depends=('gtk2' 'desktop-file-utils' 'libfm=0.1.16' 'lxmenu-data')
makedepends=('intltool' 'pkgconfig')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-$pkgver.tar.gz)
md5sums=('f31ed6defb600f7046a456220d8efa3a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --sysconfdir=/etc --prefix=/usr 
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install 
}
