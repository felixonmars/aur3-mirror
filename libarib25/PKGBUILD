# Maintainer: acounto <acounto@kamikakushi.net>

pkgname=libarib25
pkgver=0.2.4
_foldername=pt1-c44e16dbb0e2
pkgrel=4
pkgdesc="ARIB B25 test program for Linux , based on a test program written by Kazuhiro MOGI."
arch=('i686' 'x86_64')
url="http://hg.honeyplanet.jp/pt1/"
license=('custom')
depends=('pcsclite')
source=('http://hg.honeyplanet.jp/pt1/archive/c44e16dbb0e2.tar.bz2' 'Makefile.diff' 'libarib25.install')
md5sums=('805e4c7778e88521847b105eaf0b3e56' 'dd06f7ebe15ba92c25aa0304351f909c' '0c66d422b89a55ec99a894fd1554f45a')
install='libarib25.install'
build() {
  patch -p0 -i ${srcdir}/Makefile.diff
  cd ${srcdir}/$_foldername/arib25/src
  make PREFIX=/usr
}

package() {
  cd $srcdir/$_foldername/arib25/src
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/bin
  make PREFIX="${pkgdir}/usr" install
  make PREFIX="${pkgdir}/usr" install-headers
}
