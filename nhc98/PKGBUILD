# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=nhc98
pkgver=1.18
pkgrel=1
pkgdesc="nhc98 is a fully-fledged compiler for Haskell 98"
arch=('i686' 'x86_64')
makedepends=('j2sdk')
install=nhc98.install
source=(ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/nhc98src-$pkgver.tar.gz 
        ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/nhc98-$pkgver-library-interfaces.tar.gz 
        ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/patch-1.18-newtype)
url="http://www.haskell.org/nhc98/"
license=()
md5sums=('f38b74481ec01a066cc9314b7bd18c90'
         'f99f413a85462fe719ea634fd319d94f'
         'b5e714c2065a622678fa8fe5fe970056')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np0 -i ../patch-1.18-newtype
  ulimit -s unlimited
  ./configure --prefix=/usr --buildwith=gcc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
