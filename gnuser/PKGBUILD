# Gnuser (Gnu User Manager)
# Maintainer: Jonathan Salwan <jonathan.salwan [!] gnuser.org>
# Contributor: Jonathan Salwan <jonathan.salwan [!] gnuser.org>

pkgname=gnuser
pkgver=1.4.0
pkgrel=5
pkgdesc="Gnuser (Gnu Users Manager)"
arch=(i686)
url="http://www.gnuser.org"
license=('GPL')
groups=
provides=
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz/download)
md5sums=('97a14fda17fa8dbc4f0549e6bb73fc2f')
 
build() {
cd $srcdir/$pkgname-$pkgver
make || return 1
install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/sbin/$pkgname || return 1
}
