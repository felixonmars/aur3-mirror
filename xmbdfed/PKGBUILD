pkgname=xmbdfed
pkgver=4.7
pkgrel=1
pkgdesc="Motif-based BDF font editor and converter"
url="http://crl.nmsu.edu/~mleisher/xmbdfed.html"
depends=('libxpm' 'lesstif' 'libxmu')
#source=(http://crl.nmsu.edu/~mleisher/$pkgname-$pkgver.tar.bz2 patch-4.7.diff)
source=(ftp://ftp.usa.openbsd.org/pub/OpenBSD/distfiles/$pkgname-$pkgver.tar.bz2 
		patch-4.7.diff
		commit-8429573)
md5sums=('27872bb7473e5d64d9a24281ae6ad3d9'
         'ed42d7f8a3ad34d1ecb63ff2fd1ebea7'
         '3f7e714d877ccfcf039d15a1128c384a')
arch=('i686' 'x86_64')
license=('MIT')

build() { 
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../patch-4.7.diff || return 1 
  patch -Np1 -i ../commit-8429573 || return 1 
  make || return 1 
  mkdir -p $startdir/pkg/usr/bin
  install -m0755 $pkgname $startdir/pkg/usr/bin
}
