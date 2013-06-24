# Contributor: Andreas Wagner <A.Wagner@stud.uni-frankfurt.de>

pkgname=sigrot
pkgver=1.2_1
pkgrel=2
pkgdesc="Rotates your .signature file every time it is run."
arch=('i686' 'x86_64')
url="http://archive.debian.org/debian/pool/main/s/sigrot/"
license=('GPL')
source=(http://archive.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${pkgver/_/-}.tar.gz)

package() {
  cd "$srcdir/$pkgname-1.2"
  install -dm 755 $pkgdir/usr/{bin,share/man/man1}
  make DESTDIR="$pkgdir" install
}

md5sums=('3afe382371c35938b7594f7030563df9')

# vim:set ts=2 sw=2 et:
