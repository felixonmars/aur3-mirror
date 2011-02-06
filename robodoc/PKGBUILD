# Contributor: Matěj Týč <bubla@users.sourceforge.net>

pkgname=robodoc
pkgver=4.99.36
pkgrel=2
pkgdesc="ROBODoc can be used to document functions, methods, classes, variables, makefile entries, system tests, and anything else you can think of in C, C++, Fortran, Perl, shell scripts, Assembler, ... And in any other language that supports remarks"
arch=('i686' 'x86_64')
url="http://www.xs4all.nl/~rfsber/Robo/robodoc.html"
license=('GPL')
groups=()
depends=()
makedepends=()
install=
source=(http://www.xs4all.nl/~rfsber/Robo/DistSource/robodoc-4.99.36.tar.gz)
noextract=()
md5sums=('981e5c5019f4aa22fddbf57cd05e57bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  # robodoc has been using the example file by default, which is unacceptable
  mv $pkgdir/usr/share/doc/robodoc/robodoc.rc $pkgdir/usr/share/doc/robodoc/robodoc.rc.example
  }

