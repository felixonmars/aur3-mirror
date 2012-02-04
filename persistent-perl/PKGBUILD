# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=persistent-perl
pkgver=2.22
pkgrel=1
pkgdesc="Speed up perl scripts by running them persistently."
url="http://www.daemoninc.com/PersistentPerl/"
license="GPL"
depends=('glibc' 'perl')
makedepends=('perl')
conflicts=()
replaces=()
backup=()
arch=('i686')
install=
source=(http://daemoninc.com/PersistentPerl/PersistentPerl-$pkgver.tar.gz)
md5sums=('c2945c164e7457a61f70134150a222fc')

build() {
  cd $startdir/src/PersistentPerl-$pkgver
  echo "no" | perl Makefile.PL    
  make
  make DESTDIR=$startdir/pkg install  
}
