# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Milos Kozak <milos.kozak@lejmr.com>
pkgname=vsemi10ti
pkgver=1.3.0
pkgrel=1
pkgdesc="Program for education all ten fingers writing"
url="http://vsemi10ti.sourceforge.net/"
license=('GPL')
depends=(sdl sdl_image sdl_mixer sdl_ttf)
source=(http://dl.sourceforge.net/sourceforge/vsemi10ti/$pkgname-$pkgver.tar.bz2)

arch=('i686')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('a658aaf7d57039ac3ef1c32b9afcdae3')
