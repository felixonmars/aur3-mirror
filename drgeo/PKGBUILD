# Contributor: Sergio Vergara <arkanox@gmail.com>
pkgname=drgeo
pkgver=1.1.0
pkgrel=1
pkgdesc="Dr. Geo is a GTK interactive geometry software"
url="http://www.ofset.org/drgeo"
license="GPL"
depends=('xorg' 'gtk2' 'libxml2' 'libglade' 'guile')
install=
source=(http://superb.dl.sourceforge.net/sourceforge/ofset/$pkgname-$pkgver.tar.gz)
md5sums=('4ee0a887e819266740867959cbb4095f')
build() {
  cd $startdir/src/$pkgname-$pkgver
 ./configure --prefix=/usr
  make || return 1
  mkdir $startdir/pkg/usr
  make prefix=$startdir/pkg/usr install
}
