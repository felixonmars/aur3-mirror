# Contributor: Peter Simons <simons@cryp.to>

pkgname=eukleides
pkgver=1.5.4
pkgrel=1
pkgdesc="A Geometry Drawing Language"
url="http://www.eukleides.org/"
license=("GPL")
makedepends=('bison' 'flex' 'texinfo')
depends=('bash')
source=(http://www.eukleides.org/files/$pkgname-$pkgver.tar.bz2)
md5sums=('2c88fc857008c2ce23c7848c60621548')
arch=('i686' 'x86_64')
options=(!makeflags)
install=eukleides.install

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/ginstall-info/install-info/g' doc/Makefile
  make || return 1
  mkdir -p "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}
