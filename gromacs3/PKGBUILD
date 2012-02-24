# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=gromacs3
pkgver=3.3.4
pkgrel=1
pkgdesc="A fast Molecular Dynamics program based on the GROMOS force field. Last stable release of 3 version series. Only in Single precission"
url="http://www.gromacs.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('fftw' 'lesstif' 'perl')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-$pkgver.tar.gz)
md5sums=('dd1b9bd4b8c2bf4447b9fe6fb7937725')

build() {
  cd $srcdir/gromacs-$pkgver
  #./configure --prefix="/usr" --program-suffix="-3" --enable-share
  ./configure --prefix="/usr/local/gromacs/gromacs-$pkgver" --enable-share
  make
}

package() {
  cd $srcdir/gromacs-$pkgver
  make DESTDIR=${pkgdir} install
}

