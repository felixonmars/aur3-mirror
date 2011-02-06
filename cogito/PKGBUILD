# Contributor: jmtan <jmingtan@gmail.com>
pkgname=cogito
pkgver=0.18.1
pkgrel=1
pkgdesc="Cogito is popular interface to the Git version control system."
arch=('i686')
url="http://git.or.cz/cogito/"
license=('GPL3')
depends=('git')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
install=
source=(http://kernel.org/pub/software/scm/cogito/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('7170aa54c11b9cb39050946edf032854')
build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$startdir/pkg prefix=/usr install || return 1
}

