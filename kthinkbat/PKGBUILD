# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Chris Peterman <petermcv@clarkson.edu>
pkgname=kthinkbat
pkgver=0.2.9
pkgrel=1
pkgdesc="Laptop battery monitor for the KDE panel"
arch=("i686" "x86_64")
url="https://lepetitfou.dyndns.org/projects/kthinkbat"
license=('GPL')
depends=('kdelibs' 'kdebase')
makedepends=( 'autoconf' 'automake' )
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(https://lepetitfou.dyndns.org/download/kthinkbat/src/kthinkbat-0.2.x/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('aaf3a1e84b833a500b42a99dc5c0fd84')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=$(kde-config --prefix)
  make || return 1
  make DESTDIR=$startdir/pkg install
}
