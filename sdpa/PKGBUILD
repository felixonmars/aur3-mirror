# Contributor: Ilya Mezhirov <mezhirov at gmail com>
pkgname=sdpa
pkgver=7.3.1
pkgrel=1
pkgdesc="An SDP optimizer based on primal-dual interior point method"
arch=('i686' 'x86_64')
url="http://sdpa.indsys.chuo-u.ac.jp/sdpa/index.html"
license=('GPL')
groups=()
depends=('blas' 'lapack') # ('atlas-lapack') also might work
makedepends=('automake' 'autoconf')
optdepends=()
provides=()
conflicts=('mumps')
replaces=()
backup=()
options=()
install=
source=(http://sdpa.indsys.chuo-u.ac.jp/sdpa/files/sdpa.7.3.1.src-20090729.tar.gz)
noextract=()
md5sums=(5b687cd3a08c57cc8140f9f5d71a8bf9) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname.$pkgver.src"

  patch -Np1 <../../sdpa-dir-fix.patch || return 1
  patch -Np1 <../../sdpa-param-fix.patch || return 1

  # The main Makefile runs another Makefile to build MUMPS,
  # and this second Makefile uses grep and cut
  # to find options in the first Makefile
  # and transplant them into the MUMPS Makefile. 
  # What could possibly go wrong?
  patch -Np1 <../../sdpa-mumps-fix.patch || return 1

  aclocal
  automake --foreign
  autoconf

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
