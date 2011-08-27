# Contributor: Alexandre Courbot <gnurou@gmail.com>
pkgname=nsis-debian
pkgver=2.46
_debpkgrel=1
pkgrel=1
pkgdesc="A professional open source system to create Windows installers - extracted from debian binary, works for both i686 and x86_64 architectures"
arch=('i686' 'x86_64')
url='http://nsis.sourceforge.net'
license='http://nsis.sourceforge.net/License'
depends=('mingw32-runtime')
makedepends=()
source=(http://ftp.us.debian.org/debian/pool/main/n/nsis/nsis_$pkgver-$_debpkgrel\_i386.deb)
noextract=($source)
md5sums=('297ba64edee221a642d1f281ef9e3bf6')

build() {
  ar x nsis_$pkgver-$_debpkgrel\_i386.deb
  cd $pkgdir
  tar xfz $srcdir/data.tar.gz ./usr/bin ./usr/share ./etc
  cd -
}

