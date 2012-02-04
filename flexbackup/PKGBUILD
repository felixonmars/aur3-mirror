# Contributor: Norman Makoto Su <normsu@ics.uci.edu>
pkgname=flexbackup
pkgver=1.2.1
pkgrel=1
pkgdesc="A flexible backup tool"
url="http://flexbackup.sourceforge.net/"
license=""
depends=(perl findutils)
makedepends=()
conflicts=()
replaces=()
backup=('etc/flexbackup.conf')
install=flexbackup.install
source=(http://flexbackup.sourceforge.net/tarball/$pkgname-$pkgver.tar.gz)
md5sums=('4955c89dbee354248f354a9bf0a480dd')

build() {
  mkdir -p $startdir/pkg/etc
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/man/man1
  mkdir -p $startdir/pkg/usr/man/man5
  cd $startdir/src/$pkgname-$pkgver
  sed -i -e "s|PREFIX=/usr|PREFIX=$startdir/pkg/usr|" Makefile
  sed -i -e "s|MANPATH =.*$|MANPATH = $startdir/pkg/usr/man|" Makefile
  sed -i -e "s|CONFFILE =.*$|CONFFILE = $startdir/pkg/etc/flexbackup.conf|" Makefile
  make || return 1
  make install
  sed -i -e "s|\$::CONFFILE=.*$|\$::CONFFILE=\"/etc/flexbackup.conf\";|" $startdir/pkg/usr/bin/flexbackup
}
