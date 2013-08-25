# Contributor: strake (Matthew Farkas-Dyck) <strake888@gmail.com>

_pkgname=pacmerge
pkgname=pacmerge-git
pkgver=8.0a327af
pkgrel=1
pkgdesc="Program to merge .pacnew files"
arch=(i686 x86_64)
url="https://gitorious.org/pacmerge"
license=('MIT')
depends=('gmp')
makedepends=('git' 'ghc' 'haskell-directory-tree')
source=(git://gitorious.org/pacmerge/pacmerge)
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  make
}

package() {
  cd "$srcdir/$_pkgname"

  install -D $_pkgname $pkgdir/usr/bin/$_pkgname

  mkdir -p "${pkgdir}/usr/share/man/man8/"
  gzip pacmerge.8
  cp pacmerge.8.gz "${pkgdir}/usr/share/man/man8/"
}
