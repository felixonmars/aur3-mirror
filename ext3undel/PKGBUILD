# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=ext3undel
pkgver=0.1.6
pkgrel=1
pkgdesc="A collection of scripts to help you recover files from ext2/ext3 file systems"
arch=('any')
url="http://projects.izzysoft.de/trac/ext3undel"
license=('GPL')
depends=('sleuthkit' 'testdisk')
options=(!docs)
backup=('etc/ext3undel/ext3undelrc')
source=(http://projects.izzysoft.de/ftp/net/div/izzysoft/$pkgname/$pkgname-$pkgver.tar.gz)

md5sums=('996107eead228ed476e89e8b9b82242f')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}
# vim: set ts=2 sw=2 et:
