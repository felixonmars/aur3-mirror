# Contributor: Tristan Webb <tristanjwebb@gmail.com> 
pkgname=refdb
pkgver=0.9.9_1
pkgrel=1
pkgdesc="A reference database and bibliography tool for SGML, XML, and LaTeX/BibTeX documents"
url="http://refdb.sourceforge.net/"
license="GPL"
depends=('libdbi-drivers' 'readline' 'expat')
makedepends=('bash' 'make' 'gcc')
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
install=
source=(http://downloads.sourceforge.net/project/refdb/refdb-src/$pkgname-src-0.9.9-1/$pkgname-0.9.9-1.tar.gz refdbd.rc)
md5sums=('638845c9e006650c8f5fe34044c3e36a' 'cdf8cb5fdbb2dfd1dcf556ca5ee3e29f')

build() {
  cd $startdir/src/$pkgname-${pkgver/_/-}
  ./configure --prefix=/usr --with-log-dir=/var/log/refdb --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/rc.d
  cp $startdir/src/refdbd.rc $startdir/pkg/etc/rc.d/refdbd
  chmod 755 $startdir/pkg/etc/rc.d/refdbd
}
