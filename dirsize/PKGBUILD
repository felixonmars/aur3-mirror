# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=dirsize
pkgver=0.6
pkgrel=1
pkgdesc="A tool to display the total size of all files in a directory. Does NOT recurse"
arch=(i686)
url="http://plasmasturm.org/code/dirsize/"
license=('GPL')
depends=(glibc)
source=(http://plasmasturm.org/code/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('1063cef016139f3964f5a16a52a4130b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
