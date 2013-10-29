# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=qcl
pkgver=0.6.3
pkgrel=2
pkgdesc="A Programming Language for Quantum Computers"
arch=('i686' 'x86_64')
url="http://tph.tuwien.ac.at/~oemer/qcl.html"
license=('GPL')
depends=('plotutils')
optdepends=('texmacs')
install=$pkgname.install
source=(http://tph.tuwien.ac.at/~oemer/tgz/$pkgname-$pkgver.tgz Makefile.patch options.patch)
md5sums=('3dd08d2be84feb8021868914f082292d' '5287e422afb6084ebd440fae944eac75' '81ddf597252734c1569f0541fb09ac6e')


build() {
  cd $startdir/src/$pkgname-$pkgver

  patch < ../../Makefile.patch
  patch < ../../options.patch
   
  make || return 1
  make install || return 1

}
